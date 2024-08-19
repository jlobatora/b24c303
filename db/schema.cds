namespace com.logaligroup;

using {
    cuid,
    managed
} from '@sap/cds/common';

type decimal : Decimal(6,2);

entity Products : cuid, managed {
    //key ID           : UUID;
        product      : String(6);
        productName  : String(40);
        productUrl   : String;
        availability : String;
        rating       : Decimal(3, 2);
        price        : decimal;
        currency     : String default 'USD';

};

entity Details : cuid  {

    key ID         : UUID;
        baseUnit   : String;
        height     : Decimal(6, 2);
        width      : Decimal(6, 2);
        depht      : Decimal(6, 2);
        weight     : Decimal(6, 2);
        unitVolume : String(2);
        unitWeight : String(2);

};

entity Suppliers : cuid  {
    //key ID           : UUID;
        supplier     : String(9);
        supplierName : String(40);
        webAddress   : String;
};

entity Contacts  : cuid {
    //key ID          : UUID;
        fullName    : String(80);
        email       : String(120);
        phoneNumber : String(12);
};

entity Reviews  : cuid {
    //key ID           : UUID;
        rating       : Decimal(3, 2);
        creationDate : Date;
        user         : String(40);
        review       : String;
};

entity Inventory  : cuid {
    //key ID           : UUID;
    department : String;
    min        : Int16;
    max        : Int16;
    value      : Int32;
    lotSize    : Decimal(6, 2);
    quantity   : Decimal(6, 2);
    unit       : String;

};
