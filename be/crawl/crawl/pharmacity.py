import requests
import scrapy
import logging
from database import get_links_from_pharmacity
from datetime import datetime
from items import SaveToDBPharmacity
import config


class LinkPharmacity(scrapy.Spider):
    name = 'link-pharmacity'

    def start_requests(self):
        log_file_path = config.DIR_FILE + "pharmacity.txt"
        proxy_url = f"http://{config.PROXY_USER}:{config.PROXY_PASS}@{config.PROXY_IP}:{config.PROXY_PORT}"
        links = get_links_from_pharmacity()
        link_check = 'https://www.pharmacity.vn/'
        response = requests.get(link_check, proxies={"http": proxy_url, "https": proxy_url})
        count = 0
        for link in links:
            count += 1
            url = f"https://api-gateway.pharmacity.vn/api/product?slug={link}"
            with open(log_file_path, 'a') as log_file:
                try:
                    if count == 100:
                        response = requests.get(link_check, proxies={"http": proxy_url, "https": proxy_url})
                    if response.status_code == 200:
                        log_file.write('\n' + str(datetime.now()) + '\n' + link + "success")
                        yield scrapy.Request(url, callback=self.parse_product, headers={'User-Agent': 'Mozilla/5.0'},
                                             meta={'proxy': proxy_url})
                    else:
                        log_file.write('\n' + str(datetime.now()) + '\n' + link + " false")
                except requests.exceptions.RequestException as e:
                    print(f"Error occurred while checking proxy {proxy_url} for {link}: {str(e)}")
                    return

    def parse_product(self, response):
        logging.debug("loi", response.url)
        if response.status == 200:
            data = response.json()
            products = data['data']['product']

            product_name = products['name']
            product_price = products['pricing']['priceRange']['start']['gross']['amount']
            total_quantity = products['variants'][0]['quantityAvailable']
            original_price = products['pricing']['priceRangeUndiscounted']['start']['gross']['amount']
            crawl_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            if total_quantity < 0:
                total_quantity = 0
            link = products['slug']

            item = SaveToDBPharmacity()
            item['name'] = product_name
            item['price'] = product_price
            item['total'] = total_quantity
            item['original_price'] = original_price
            item['crawl_time'] = crawl_time
            item['link'] = link
            item['table_name'] = 'pharmacity'
            yield item
        else:
            self.logger.error('Yêu cầu không thành công. Mã lỗi: %s', response.status)