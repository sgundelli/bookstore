using {
  Currency,
  managed,
  sap
} from '@sap/cds/common';

namespace sap.capire.bookshop;

entity Books : managed {
  key ID       : Integer;
      title    : localized String(111)  @mandatory;
      descr    : localized String(1111);
      author   : Association to Authors @mandatory;
      genre    : Association to Genres;
      stock    : Integer;
      price    : Decimal;
      currency : Currency;
      image    : LargeBinary            @Core.MediaType: 'image/png';
}

entity Authors : managed {
  key ID           : Integer;
      name         : String(111) @mandatory;
      dateOfBirth  : Date;
      dateOfDeath  : Date;
      placeOfBirth : String;
      placeOfDeath : String;
      books        : Association to many Books
                       on books.author = $self;
}

/** Hierarchically organized Code List for Genres */
entity Genres : sap.common.CodeList {
  key ID       : Integer;
      parent   : Association to Genres;
      children : Composition of many Genres
                   on children.parent = $self;
}

/** Products */
entity Products {
  key productId     : String(15);
      Category      : String(20);
      MainCategory  : String(20);
      TaxTarifCode  : Integer;
      SupplierId    : String(15);
      SupplierName  : String(50);
      WeightMeasure : Decimal(5, 2);
      WeightUnit    : String(2);
      Description   : String(500);
      Name          : String(200);
      DateOfSale    : Date;
      ProductPicUrl : String(200);
      Status        : String(50);
      Quantity      : Integer;
      UoM           : String(10);
      CurrencyCode  : Currency;
      Price         : Integer;
      Width         : Integer;
      Depth         : Integer;
      Height        : Integer;
      DimUnit       : String(5);
      suppliers     : Association to Suppliers;
}

entity Suppliers {
  key productId  : String(15);
  key SupplierId : String(15);
      name       : String(20);
      products   : Association to many Products on products.productId = $self.productId;
}
