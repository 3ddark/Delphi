{---Info---
  Unit Name     : ThsERP.inc
  Descriptions  : Geliştirici uygulamanın nasıl kullanılması gerektiği ile ilgili derleyici direktiflerini burada belirtecek
  Created By    : Ferhat YILDIRIM
  Modified By   : -
}

{$DEFINE MIGRATE}
{$DEFINE THSERP}

//Geliştirici demo bilgilerini kullanmak istediğinde bu direktifi kullanacak.
//The developer will use this directive when he wants to use the demo data.
{$DEFINE DUMMY_VALUE}

//Geliştiricinin Select, Insert, Update, Delete işlemlerini hangi metod ile gerçekleştireceğini burada belirliyoruz.
//Here, we determine which method the developer will perform Select, Insert, Update, Delete operations.
{$DEFINE CRUD_MODE_PURE_SQL}  //CRUD_MODE_SP - CRUD_MODE_PURE_SQL
