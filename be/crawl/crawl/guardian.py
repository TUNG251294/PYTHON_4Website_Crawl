import requests
import scrapy
import logging
from bs4 import BeautifulSoup
from datetime import datetime
import config
from database import get_links_from_guardian
from items import SaveToDBGuardian
from proxy_checking import ProxyChecker


class LinkSpider(scrapy.Spider):
    name = 'link-guardian'

    def start_requests(self):
        link_check = 'https://www.guardian.com.vn/'
        log_file_path = config.DIR_FILE + "guardian.txt"
        proxy_url = f"http://{config.PROXY_USER}:{config.PROXY_PASS}@{config.PROXY_IP}:{config.PROXY_PORT}"
        links = get_links_from_guardian()
        response = requests.get(link_check, proxies={"http": proxy_url, "https": proxy_url})
        count = 0
        for link in links:
            count += 1
            with open(log_file_path, 'a') as log_file:
                try:
                    if count == 100:
                        response = requests.get(link_check, proxies={"http": proxy_url, "https": proxy_url})
                    if response.status_code == 200:
                        yield scrapy.Request(url=link, callback=self.parse, meta={'proxy': proxy_url})
                        log_file.write('\n' + str(datetime.now()) + '\n' + link + "success")
                    else:
                        log_file.write('\n' + str(datetime.now()) + '\n' + link + "false")
                except requests.exceptions.RequestException as e:
                    print(f"Error occurred while checking proxy {proxy_url} for {link}: {str(e)}")
                    return

    def parse(self, response, **kwargs):
        logging.debug("loi", response.url)
        if response.status == 200:
            html_content = response.body
            soup = BeautifulSoup(html_content, "html.parser")
            div_element_name = soup.find("div", class_="product-title")
            if div_element_name:
                product_name = div_element_name.find("h1").text.strip()
            else:
                product_name = None

            span_element_price = soup.find("span", class_="pro-price")
            if span_element_price:
                product_price = span_element_price.text.strip().replace(",", "").replace("₫", "")
            else:
                product_price = None
            del_original_price = soup.find("div", class_="product-price").find("del")
            if del_original_price:
                original_price = del_original_price.text.strip().replace(",", "").replace("₫", "")
            else:
                original_price = span_element_price.text.strip().replace(",", "").replace("₫", "")

            button_element = soup.find("button", class_="add-to-cartProduct")
            if button_element and button_element.has_attr("disabled"):
                product_status = "Hết hàng"
            else:
                product_status = "Còn hàng"

            div_tag = soup.find('div', {'class': 'fb-like'})
            link = div_tag.get('data-href')
            print(link)
            crawl_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            item = SaveToDBGuardian()
            item['name'] = product_name
            item['price'] = product_price
            item['original_price'] = original_price
            item['status'] = product_status
            item['crawl_time'] = crawl_time
            item['link'] = link
            item['table_name'] = 'guardian'
            yield item
        else:
            self.logger.error('Yêu cầu không thành công. Mã lỗi: %s', response.status)
