namespace com.logali;

using {
    cuid,
    managed
} from '@sap/cds/common';

type decimal : Decimal(16, 2);
type Name    : String(50);

//Tipo enumerado
type Gender  : String enum {
    male;
    female;
};

entity Order {
    clientGender : Gender;
    status       : Integer enum {
        submitted  = 1;
        fullfiller = 2;
        shipped    = 3;
        cancel     = -1;
    };
    priority     : String @assert.range enum {
        high;
        medium;
        low;
    };
}


entity Products : managed {
    key ID               : UUID;
        Name             : String(40) not null;
        Description      : String(200);
        ImageUrl         : String;
        ReleaseDate      : Date default $now; //datetime del momento //Date default CURRENT_DATE;
        DiscontinuedDate : Date;
        Price            : decimal;
        Height           : type of Price;
        Width            : Decimal(16, 2);
        Depth            : Decimal(16, 2);
        Quantity         : Decimal(16, 2);

};


type Adress  : {
    Street     : String;
    City       : String;
    State      : String(2);
    PostalCode : String(5);
    Country    : String(3);
};


entity Suppliers {
    key ID      : UUID;
        Name    : type of Products : Name;
        //street       : String;
        //city         : String;
        //state        : String(2);
        //postalCode   : String(5);
        //country      : String(3);
        address : Adress;
        Email   : String;
        Phone   : String;
        Fax     : String;
};


entity Details : cuid {

    key ID         : UUID;
        baseUnit   : String;
        height     : Decimal(6, 2);
        width      : Decimal(6, 2);
        depht      : Decimal(6, 2);
        weight     : Decimal(6, 2);
        unitVolume : String(2);
        unitWeight : String(2);

};

entity Contacts : cuid {
    //key ID          : UUID;
    fullName    : String(80);
    email       : String(120);
    phoneNumber : String(12);
};


entity Inventory : cuid {
    //key ID           : UUID;
    department : String;
    min        : Int16;
    max        : Int16;
    value      : Int32;
    lotSize    : Decimal(6, 2);
    quantity   : Decimal(6, 2);
    unit       : String;

};


entity Categories {
    key ID   : String(1);
        name : String;
};


entity StockAvailability {
    key ID          : Integer;
        description : String;
};

entity Currencies {
    key ID          : String(3);
        description : String;
};


entity unitOfMeasures {
    key ID          : String(2);
        description : String;

};

entity DimensionUnits {
    key ID          : String(2);
        description : String;
};

entity Months {
    key ID               : String(2);
        description      : String;
        shortDescription : String(3);
};


entity ProductReviews {
        key ID           : UUID;
        Name      : String;
        Rating    : Integer;
        Comment   : String;
        CreatedAt : Date;

};


entity SalesData {
    key ID           : UUID;
        deliveryDate : Date;
        revenue      : Decimal(16, 2)
};


// type EmailsAddresses_01 : {
//     kind  : String;
//     email : String;
// };


// type EmailsAddresses_02 : {
//     kind  : String;
//     email : String;
// };

// entity Emails {
//     email_01 :      EmailsAddresses_01;
//     email_02 : many EmailsAddresses_02;
//     email_03 : many {
//         kind  : String;
//         email : String;
//     }
// };

entity Cars {
    key ID                 : UUID;
        name               : String;
        virtual discount_1 : Decimal;
        virtual discount_2 : Decimal;
};


//Entidades de pryeccion o de select

entity SelProducts  as select from Products;

entity SelProducts1 as
    select from Products {
        *
    };

entity SelProducts2 as
    select from Products {
        Name,
        Price,
        Quantity
    };

entity SelProducts3 as
    select from Products
    left join ProductReviews
        on Products.Name = ProductReviews.Name
    {
        Rating,
        Products.Name,
        sum(Price) as TotalPrice
    }
    group by
        Rating,
        Products.Name
    order by Rating;
