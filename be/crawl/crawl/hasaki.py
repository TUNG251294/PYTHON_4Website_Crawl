import scrapy
import logging
import requests
from bs4 import BeautifulSoup
from datetime import datetime
import config
from database import get_links_from_database
from items import SaveToDBHasaki


class LinkSpider(scrapy.Spider):
    name = 'link-spider'

    def start_requests(self):

        proxy_url = f"http://{config.PROXY_USER}:{config.PROXY_PASS}@{config.PROXY_IP}:{config.PROXY_PORT}"
        links = get_links_from_database()
        link_check = 'https://hasaki.vn/'
        response = requests.get(link_check, proxies={"http": proxy_url, "https": proxy_url})
        count = 0
        for link in links:
            count += 1
            # log_file_path = config.DIR_FILE + "hasaki.txt"
            # with open(log_file_path, 'a') as log_file:
            try:
                if count == 100:
                    response = requests.get(link_check, proxies={"http": proxy_url, "https": proxy_url})
                if response.status_code == 200:
                    # log_file.write('\n' + str(datetime.now()) + '\n' + link + "success")
                    yield scrapy.Request(url=link, callback=self.parse, meta={'proxy': proxy_url})
                else:
                    # log_file.write('\n' + str(datetime.now()) + '\n' + link + "fail")
                    return
            except requests.exceptions.RequestException as e:
                return

    def parse(self, response, **kwargs):
        logging.debug("log", response.url)
        if response.status == 200:

            html_content = response.body
            soup = BeautifulSoup(html_content, "html.parser")
            span_element_name = soup.find('span', class_='product__title', itemprop="name")
            product_name = span_element_name.text.strip()

            span_element_price = soup.find('span', class_='txt_price')
            product_price = span_element_price.text.strip().replace("₫", "").replace(".", "")

            span_original_price = soup.find('span', id='market_price')
            if span_original_price and span_original_price.text[0] != '0':
                original_price = span_original_price.text.strip().replace("₫", "").replace(".", "")
            else:
                original_price = product_price

            div = soup.find('div', class_='button_check_stock_card')
            if div:
                b = div.find("b").text.strip()
                if b[0] != '0':
                    product_status = 'Còn hàng'
                else:
                    product_status = 'Hết hàng'
            else:
                product_status = None
            crawl_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

            div_tag = soup.find('div', {'class': 'fb-like'})
            link = div_tag.get('data-href')

            item = SaveToDBHasaki()
            item['name'] = product_name
            item['price'] = product_price
            item['original_price'] = original_price
            item['status'] = product_status
            item['crawl_time'] = crawl_time
            item['link'] = link
            item['table_name'] = 'hasaki'
            yield item
        else:
            self.logger.error('Yêu cầu không thành công. Mã lỗi: %s', response.status)
