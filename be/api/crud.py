from datetime import datetime
import urllib.parse

import aiohttp
import requests
from bs4 import BeautifulSoup
from fastapi import status
from sqlalchemy import desc
from sqlalchemy.orm import Session

import config
import models
import schemas


def get_all_guardian(db: Session, skip: int, limit: int, name: str = None):
    query = db.query(models.Guardian)

    if name is not None and name != "undefined":
        query = query.filter(models.Guardian.name.ilike(f"%{name.replace(' ', '%')}%"))

    query = query.order_by(desc(models.Guardian.crawl_time))
    counter = skip + 1
    results = []

    for object in query.offset(skip).limit(limit).all():
        objectDto = {
            'id': counter,
            'name': object.name,
            'price': object.price,
            'status': object.status if object.status else "",
            'original_price': object.original_price,
            'crawl_time': object.crawl_time
        }
        counter += 1
        results.append(objectDto)
    response = schemas.GuardianList(
        listGuardian=results,
        count=query.count()
    )
    return response


async def crawl_guardian(keyWord: str):
    product_list = []
    id = 1
    for i in range(1, 5):
        session = aiohttp.ClientSession()
        headers = {
            'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (HTML, like Gecko) Chrome/105.0.0.0 Safari/537.36'
        }
        encode_string = urllib.parse.quote(keyWord)
        url = f"https://www.guardian.com.vn/search?type=product&q=filter=((title%3Aproduct%20contains%20{encode_string})%7C%7C(titlespace%3Aproduct%3D*{encode_string})%7C%7C(sku%3Aproduct%20contains%20{encode_string}))&sortby=(sold_quantity:product=desc)&page={i}"

        proxy_url = f"http://{config.PROXY_USER}:{config.PROXY_PASS}@{config.PROXY_IP}:{config.PROXY_PORT}"

        try:
            async with session.get(url, headers=headers, proxy=proxy_url) as resp:
                if resp.status != 200:
                    return {"error": f"bad status code {resp.status}"}

                soup = BeautifulSoup(await resp.text(), "html.parser")

                product_elements = soup.find_all("div", class_="col-md-3 col-sm-6 col-xs-6 pro-loop")
                for product_element in product_elements:
                    product_info = {"stt": id}
                    id += 1

                    name_element = product_element.find("h3", class_="pro-name")
                    if name_element:
                        product_info["name"] = name_element.text.strip()
                    else:
                        product_info["name"] = None
                    price_element = product_element.find("span", class_="p-compare")
                    if price_element:
                        product_info["price"] = price_element.text.strip().replace(",", "").replace("₫", "")
                    else:
                        product_info["price"] = None
                    link_element = product_element.find("a")
                    if link_element:
                        href = link_element.get('href')
                        product_info["link"] = "https://www.guardian.com.vn" + href
                        product_info["id"] = href
                    else:
                        product_info["link"] = None
                    product_list.append(product_info)


        except aiohttp.ClientError as e:
            return e
        finally:
            await session.close()
    return product_list


def save_guardian_links(link_list: schemas.SLinkList, db: Session):
    try:
        links = db.query(models.GuardianLink).all()
        saveLinks = []
        cur_save_size = 0
        for s_link in link_list.s_links:
            count = sum(1 for link in links if link.link == s_link)
            if count == 0:
                cur_save_size += 1
                create_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
                print(create_time)
                db_link = models.GuardianLink(link=s_link, create_time=create_time)
                saveLinks.append(db_link)
        db.add_all(saveLinks)
        db.commit()
        response = schemas.Response(message="successful", size=cur_save_size)
        return response
    except Exception as e:
        db.rollback()
        return schemas.Response(message=str(e)), status.HTTP_400_BAD_REQUEST
    finally:
        db.close()


# ____________________________________________________________________________


def get_all_hasaki(db: Session, skip: int, limit: int, name: str = None):
    query = db.query(models.Hasaki)
    if name is not None and name != "undefined":
        query = query.filter(models.Hasaki.name.ilike(f"%{name.replace(' ', '%')}%"))

    query = query.order_by(desc(models.Hasaki.crawl_time))

    counter = skip + 1
    results = []

    for object in query.offset(skip).limit(limit).all():
        objectDto = {
            'id': counter,
            'name': object.name,
            'price': object.price ,
            'status': object.status if object.status else "",
            'original_price': object.original_price,
            'crawl_time': object.crawl_time
        }
        counter += 1

        results.append(objectDto)
    response = schemas.HasakiList(
        listHasaki=results,
        count=query.count()
    )
    return response


async def crawl_hasaki(keyWord: str):
    session = aiohttp.ClientSession()
    headers = {
        'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (HTML, like Gecko) Chrome/105.0.0.0 '
                      'Safari/537.36'
    }
    encode_string = urllib.parse.quote(keyWord)
    url = f"https://hasaki.vn/catalogsearch/result/?q={encode_string}"

    proxy_url = f"http://{config.PROXY_USER}:{config.PROXY_PASS}@{config.PROXY_IP}:{config.PROXY_PORT}"

    try:
        async with session.get(url, headers=headers, proxy=proxy_url) as resp:
            if resp.status != 200:
                return {"error": f"bad status code {resp.status}"}

            soup = BeautifulSoup(await resp.text(), "html.parser")
            product_list = []
            product_elements = soup.find_all("div", class_="item_list_cate")
            id = 1
            for product_element in product_elements:
                product_info = {"stt": id}
                id += 1
                name_element = product_element.find("div", class_="vn_names")
                if name_element:
                    product_info["name"] = name_element.text.strip()
                else:
                    product_info["name"] = None
                brand_element = product_element.find("div", class_="width_common txt_color_1 space_bottom_3")
                if brand_element:
                    product_info["brand_name"] = brand_element.text.strip()
                else:
                    product_info["brand_name"] = None

                price_element = product_element.find("strong", class_="item_giamoi")
                if price_element:
                    product_info["price"] = price_element.text.strip().replace(" ", "").replace("₫", "").replace(".",
                                                                                                                 "")
                else:
                    product_info["price"] = None

                quantity_element = product_element.find("span", class_="item_count_by")
                if quantity_element:
                    product_info["quantity"] = quantity_element.text.strip()
                else:
                    product_info["quantity"] = None

                link_element = product_element.find("a", class_="block_info_item_sp width_common")
                if link_element:
                    href = link_element.get('href')
                    product_info["link"] = href
                    product_info["id"] = href
                else:
                    product_info["link"] = None

                product_list.append(product_info)

        return product_list
    except aiohttp.ClientError as e:
        return e
    finally:
        await session.close()


def save_hasaki_links(db: Session, link_list: schemas.SLinkList):
    try:
        links = db.query(models.HasakiLink).all()
        saveLinks = []
        cur_save_size = 0
        for s_link in link_list.s_links:
            count = sum(1 for link in links if link.link == s_link)
            if count == 0:
                cur_save_size += 1
                create_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
                db_link = models.HasakiLink(link=s_link, create_time=create_time)
                saveLinks.append(db_link)
        db.add_all(saveLinks)
        db.commit()
        response = schemas.Response(message="successful", size=cur_save_size)
        return response
    except Exception as e:
        db.rollback()
        return schemas.Response(message=str(e)), status.HTTP_400_BAD_REQUEST
    finally:
        db.close()


# watsons____________________________________________________________________


def get_all_watsons(db: Session, skip: int, limit: int, name: str = None):
    query = db.query(models.Watson)

    if name is not None and name != "undefined":
        query = query.filter(models.Watson.name.ilike(f"%{name.replace(' ', '%')}%"))

    query = query.order_by(desc(models.Watson.crawl_time))
    counter = skip + 1
    results = []

    for object in query.offset(skip).limit(limit).all():
        objectDto = {
            'id': counter,
            'name': object.name,
            'price': object.price,
            'total': object.total,
            'original_price': object.original_price,
            'crawl_time': object.crawl_time
        }
        counter += 1
        results.append(objectDto)
    response = schemas.WatsonList(
        listWatson=results,
        count=query.count()
    )
    return response


def crawl_watsons(keyWord: str):
    url = "https://gb8u4czbqv-dsn.algolia.net/1/indexes/*/queries"
    headers = {
        "X-Algolia-Api-Key": "0aef964c3b68a7b11ba36b8936971de0",
        "X-Algolia-Application-Id": "GB8U4CZBQV"
    }

    proxies = {
        "http": f"http://{config.PROXY_USER}:{config.PROXY_PASS}@{config.PROXY_IP}:{config.PROXY_PORT}",
        "https": f"http://{config.PROXY_USER}:{config.PROXY_PASS}@{config.PROXY_IP}:{config.PROXY_PORT}"
    }
    keyWord = urllib.parse.quote(keyWord)
    request_body = {
        "requests": [
            {
                "indexName": "ProductPROD_WTCVN",
                "params": "clickAnalytics=true&facets=%5B%22category_lv1_vi%22%2C%22brand_vi%22%2C%22promo_vi%22%2C%22memberPrice%22%2C%22availability%22%2C%22storepickupallowed%22%2C%22xBorder%22%2C%22price_value%22%2C%22avg_rating%22%2C%22colorCode%22%2C%22subscription%22%2C%22prescription%22%2C%22refillPack%22%2C%22cleanBeauty%22%2C%22halal%22%2C%22organic%22%2C%22betterIngredients_vi%22%2C%22betterPackaging_vi%22%2C%22volume_vi%22%2C%22shopperType_vi%22%2C%22latestTrends_vi%22%5D&highlightPostTag=__%2Fais-highlight__&highlightPreTag=__ais-highlight__&hitsPerPage=50&maxValuesPerFacet=999&page=0&query=" + keyWord + "&tagFilters="
            }
        ]
    }

    product_list = []
    id = 1
    response = requests.post(url, headers=headers, json=request_body, proxies=proxies)
    data = response.json()
    watson = data["results"][0]["hits"]
    for item in watson:
        product_info = {"stt": id}
        id += 1
        product_info["id"] = item["id"]
        product_info["name"] = item["name_vi"]
        product_info["price"] = item["price_value"]
        try:
            product_info["original_price"] = item["oldprice"].split()[0].replace('.', '')
        except IndexError:
            product_info["original_price"] = None
        product_info["link"] = item["productUrl"]
        product_list.append(product_info)
    return product_list


def save_watsons_links(db: Session, link_list: schemas.SLinkListWatson):
    try:
        links = db.query(models.WatsonLink).all()
        saveLinks = []
        cur_save_size = 0
        for s_link in link_list.s_links:
            count = sum(1 for link in links if link.link == s_link.link)
            if count == 0:
                cur_save_size += 1
                create_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
                print(create_time)
                db_link = models.WatsonLink(link=s_link.link, id_watson=s_link.id_watson, create_time=create_time)
                saveLinks.append(db_link)
        db.add_all(saveLinks)
        db.commit()
        response = schemas.Response(message="successful", size=cur_save_size)
        return response
    except Exception as e:
        db.rollback()
        return schemas.Response(message=str(e), size=None), status.HTTP_400_BAD_REQUEST
    finally:
        db.close()


# Pharmacity
def get_all_pharmacitys(db: Session, skip: int, limit: int, name: str = None):
    query = db.query(models.Pharmacity)
    if name is not None and name != "undefined":
        query = query.filter(models.Pharmacity.name.ilike(f"%{name.replace(' ', '%')}%"))

    query = query.order_by(desc(models.Pharmacity.crawl_time))

    counter = skip + 1
    results = []

    for pharmacity in query.offset(skip).limit(limit).all():
        pharmacity_dict = {
            'id': counter,
            'name': pharmacity.name,
            'price': pharmacity.price,
            'total': pharmacity.total,
            'original_price': pharmacity.original_price,
            'crawl_time': pharmacity.crawl_time
        }

        counter += 1
        results.append(pharmacity_dict)
    response = schemas.PharmacityList(
        listPharmacity=results,
        count=query.count()
    )
    return response


def create_link_pharmacity(db: Session, s_links: schemas.SLinkList):
    try:
        links = db.query(models.PharmacityLink).all()
        saveLinks = []
        cur_save_size = 0
        for s_link in s_links.s_links:
            count = sum(1 for link in links if link.link == s_link)
            if count == 0:
                cur_save_size += 1
                create_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
                db_link = models.PharmacityLink(link=s_link, create_time=create_time)
                saveLinks.append(db_link)
        db.add_all(saveLinks)
        db.commit()
        response = schemas.Response(message="successful", size=cur_save_size)
        return response
    except Exception as e:
        db.rollback()
        return schemas.Response(message=str(e)), status.HTTP_400_BAD_REQUEST
    finally:
        db.close()


def search_pharmacity(keyWord: str):
    url = 'https://api-gateway.pharmacity.vn/api/product-search'
    headers = {
        'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (HTML, like Gecko) Chrome/105.0.0.0 Safari/537.36'
    }
    params = {
        'search': keyWord,
        'size': '50'
    }
    proxy_url = f"http://{config.PROXY_USER}:{config.PROXY_PASS}@{config.PROXY_IP}:{config.PROXY_PORT}"
    proxies = {
        'http': proxy_url,
        'https': proxy_url
    }

    response = requests.get(url, headers=headers, params=params, proxies=proxies)

    if response.status_code == 200:
        data = response.json()
        products = data['data']['products']['edges']
        id = 1
        processed_data = []
        for item in products:
            quantity = item['node']['variants'][0]['quantityAvailable']
            if quantity < 0:
                quantity = 0
            product_data = {
                'stt': id,
                'id': item['node']['id'],
                'name': item['node']['name'],
                'price': item['node']['pricing']['priceRange']['start']['gross']['amount'],
                'link': item['node']['slug'],
                'quantity': quantity,
                'originalPrice': item['node']['pricing']['priceRangeUndiscounted']['start']['gross']['amount']
            }
            id += 1
            processed_data.append(product_data)
        return processed_data
    else:
        # Xử lý khi có lỗi xảy ra
        return []


def get_user_by_username(db: Session, username: str):
    return db.query(models.Account).filter(models.Account.username == username)


def get_token(db: Session, token: str):
    return db.query(models.Account).filter(models.Account.token == token)
