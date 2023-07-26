import requests
import scrapy
import logging
import xml.etree.ElementTree as ET
from datetime import datetime
from database import get_links_from_watson
import config


log_file_path = config.DIR_FILE + "watson.txt"


class WatsonSpider(scrapy.Spider):
    name = 'watson-spider'

    def start_requests(self):
        links = get_links_from_watson()
        proxy_url = f"http://{config.PROXY_USER}:{config.PROXY_PASS}@{config.PROXY_IP}:{config.PROXY_PORT}"
        link_check = 'https://www.guardian.com.vn/'
        response = requests.get(link_check, proxies={"http": proxy_url, "https": proxy_url})
        count = 0
        for link in links:
            with open(log_file_path, 'a') as log_file:
                product_code = f"BP_{link}"
                url = f"https://api.watsons.vn/api/v2/wtcvn/products/{product_code}"
                params = {
                    'fields': 'code,name,summary,price(formattedValue),images(galleryIndex,FULL),baseProduct,averageRating,classifications,manufacturer,numberOfReviews,categories(FULL),baseOptions,variantOptions,variantType,FULL,availableForPickup,configurable,configuratorType,defaultVariantCode,description,elabCountryDeliveryModeMap,elabDisplayGrossWeight,elabEndPricePromotion(FULL),elabPreOrderDeliveryDate,elabPreOrderStartDate,elabPreOrderEndDate,elabExclusiveBrand,elabIsAdultOnly,elabIsSDD,elabIsStorePickupAllowed,elabMarkDownEliteMemPrice(FULL),elabMarkDownMemPrice(FULL),elabMarkDownPrice(FULL),elabMaxOrderQuantity,elabPrice(FULL),elabPromoEndDate,elabPromoStartDate,elabPromotionEndPrice(FULL),elabRoutingLocation(FULL),elabSubscribable,elabSubscriptionMode,elabVariantType,elabWeight,elabXBorderReferencePricePerProduct,elabXBorderReferenceTaxPricePerProduct,elabXBorderTaxPricePerProduct,masterBrand(FULL),maxOrderQuantity,multidimensional,priceRange,stock(ASIA_DEFAULT),subscriptionOfferList,tags,url',
                    'lang': 'vi',
                    'curr': 'VND'
                }
                try:
                    if count == 100:
                        response = requests.get(link_check, proxies={"http": proxy_url, "https": proxy_url})
                    if response.status_code == 200:
                        yield scrapy.Request(url, meta={'params': params, 'proxy': proxy_url}, callback=self.parse)
                        log_file.write('\n' + str(datetime.now()) + '\n' + link + "success")
                    else:
                        log_file.write('\n' + str(datetime.now()) + '\n' + link + "false")
                        return
                except requests.exceptions.RequestException as e:
                    print(f"Error occurred while checking proxy {proxy_url} for {link}: {str(e)}")
                    return

    def parse(self, response):
        logging.debug("loi", response.url)
        xml_data = response.text
        root = ET.fromstring(xml_data)
        with open(log_file_path, 'a') as log_file:

            product_name = root.find('shortDescription').text
            log_file.write('\n' + str(datetime.now()) + '\n'+ product_name + "danh dau loi NoneType")
            product_price = root.find('variantOptions/priceData/value').text
            total_quantity = root.find('variantOptions/stock/stockLevel').text
            original_price = root.find('elabPrice/value').text
            crawl_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            name = root.find('variantOptions/code').text
            link = f"https://www.watsons.vn/{name}"
            item = {
                'name': product_name,
                'price': product_price,
                'total': total_quantity,
                'original_price': original_price,
                'crawl_time': crawl_time,
                'link': link,
                'table_name': 'watson'
            }
            yield item
