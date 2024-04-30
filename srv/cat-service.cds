// using my.bookshop as my from '../db/data-model';

// service CatalogService {
//     @readonly entity Books as projection on my.Books;
// }
using {sap.capire.bookshop as my} from '../db/data-model';

service AdminService
   {
   @draft.enabled:true entity Books   as projection on my.Books;
    entity Authors as projection on my.Authors;
}
