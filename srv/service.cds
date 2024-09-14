using { com.logaligroup as entities } from '../db/schema';

service logaligroup {

    entity ProductSet as projection on entities.Products;
    entity DetailSet as projection on entities.Details;

    
    
    

}