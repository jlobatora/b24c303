using { com.logali as entities } from '../db/schema';

service logali {

    entity ProductSet as projection on entities.Products;
    //entity DetailSet as projection on entities.Details;
    entity SupplierSet as projection on entities.Suppliers;
    entity CarsSet as projection on entities.Cars;

    
    
    

}