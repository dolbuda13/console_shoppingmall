
import 'dart:io';
import 'dart:convert' show utf8;

class Product {
  String productname ;
  int price ;

  Product(this.productname, this.price);
}

class ShoppingMall{
  List <Product> products = [];
  int totalprice = 0;

  ShoppingMall(this.products); //생성인자 

  void showProducts(){
    for (var product in products){
      print('${product.productname} / ${product.price} 원' );
    }
  }

  void addToCart(String productname, int quantity){
    var product = products.firstWhere((p) => p.productname == productname);
    totalprice += product.price * quantity;
  }

  void showTotal() {
    print('장바구니에 $totalprice 원 어치를 담으셨네요 !'); // 총 가격 출력
  }

}

void main() {
  Product shirt = Product('shirt', 45000);
  Product dress = Product('dress', 30000);
  Product tshirt = Product('tshirt', 35000);
  Product shorts = Product('shorts', 38000);
  Product socks = Product('socks', 5000);

  ShoppingMall showmall = ShoppingMall([shirt, dress, tshirt, shorts, socks]);//상품 목록 생성

  List<String> productNames = [];//2번 용 상품 검색 리스트 만들기
for (var product in showmall.products) {
  productNames.add(product.productname);
}

  bool onoff = true; //4를 입력하기 전까지 while문이 돌아가게 참으로 고정
  while (onoff) {
  print('[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료');
  var menu = int.tryParse(stdin.readLineSync() ?? '0');
  if (menu == 1){//상품 목록 보기
    showmall.showProducts();//출력메소드 이용

  }else if (menu == 2){//장바구니 담기
    print('상품 이름을 입력해 주세요 !');
    String ? wishproduct = stdin.readLineSync();

    print('상품 개수를 입력해 주세요 !');
    String? quantity = stdin.readLineSync();

    if(!productNames.contains(wishproduct)){
      print('입력값이 올바르지 않아요!');
    }
    else if(quantity==null){
      print('입력값이 올바르지 않아요!');
    }

    else {
      try {
        int? countablequantity;
        countablequantity = int.parse(quantity);//입력값이 정수인지 확인

        if (countablequantity>0 && wishproduct!=null){//상품개수 양수인지 확인

          showmall.addToCart(wishproduct, countablequantity);
          print('장바구니에 상품이 담겼어요 !');
        }
        else{
          print('0개보다 많은 개수의 상품만 담을 수 있어요 !');
        }
      }
      catch (e){
        print('입력값이 올바르지 않아요!');
      }
    }

    
  }else if (menu == 3){//장바구니에 담긴 상품들의 총 가격
    showmall.showTotal();
    
  }else if (menu == 4){
    onoff = false; //4가 입력됐으므로 반복문 종료
  }else{
    print ('지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..');
  }
  }
} 
