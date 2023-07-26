import scrapy


class SaveToDB(scrapy.Item):
    name = scrapy.Field()
    price = scrapy.Field()
    total = scrapy.Field()
    quantity = scrapy.Field()
    brand_name = scrapy.Field()


class SaveToDBHasaki(scrapy.Item):
    name = scrapy.Field()
    price = scrapy.Field()
    original_price = scrapy.Field()
    status = scrapy.Field()
    crawl_time = scrapy.Field()
    link = scrapy.Field()
    table_name = scrapy.Field()


class SaveToDBPharmacity(scrapy.Item):
    name = scrapy.Field()
    price = scrapy.Field()
    total = scrapy.Field()
    original_price = scrapy.Field()
    crawl_time = scrapy.Field()
    link = scrapy.Field()
    table_name = scrapy.Field()


class SaveToDBGuardian(scrapy.Item):
    name = scrapy.Field()
    price = scrapy.Field()
    original_price = scrapy.Field()
    status = scrapy.Field()
    crawl_time = scrapy.Field()
    link = scrapy.Field()
    table_name = scrapy.Field()


class SaveToDBWatsons(scrapy.Item):
    name = scrapy.Field()
    price = scrapy.Field()
    total = scrapy.Field()
    original_price = scrapy.Field()
    crawl_time = scrapy.Field()
    link = scrapy.Field()
    table_name = scrapy.Field()

