
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
      print('${product.productname} / ${product.price}');
    }
  }
}

void main() {
  bool onoff = true; //4를 입력하기 전까지 while문이 돌아가게 참으로 고정
  while (onoff) {
  print('[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료');
  var menu = int.tryParse(stdin.readLineSync() ?? '0');
  if (menu == 1){
    Product shirt = Product('셔츠', 45000);
    Product dress = Product('원피스', 30000);
    Product tshirt = Product('반팔티', 35000);
    Product shorts = Product('반바지', 38000);
    Product socks = Product('양말', 5000);

    ShoppingMall showmall = ShoppingMall([shirt, dress, tshirt, shorts, socks]);

    showmall.showProducts();//출력메소드 이용
  }else if (menu == 2){

  }else if (menu == 3){

  }else if (menu == 4){
    onoff = false; //4가 입력됐으므로 반복문 종료
  }else{
    print ('지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..');
  }
  }
} 
