import { Injectable } from '@angular/core';
import { Product } from './product';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { map, catchError } from 'rxjs/operators';



@Injectable({
  providedIn: 'root'
})

export class CartService {

	// private catalogsUrl = 'http://localhost:3000/ecommerse/api/catalogs.json?page=2&per_page=50';
	private baseUrl = "http://localhost:3000/ecommerse/api/"
	params :any = {};

	constructor(private http: HttpClient) { 
	}

  cartData:any = {};

  addToCart(params: any):Observable<any> {
    return this.http.post<any>(this.baseUrl + "purchases/add_to_cart.json", params)
  }

  getItems(){
  	return  this.cartData.items
  }

  updateCartData(params: any):Observable<any> {
    return this.http.post<any>(this.baseUrl + "purchases/update_cart_data.json", params)
  }

  getCartData(cId: number): Observable<any>{
  	this.params = new HttpParams().set('customer_id', cId)
  	return this.http.get<any>(this.baseUrl + "purchases/fetch_active_cart.json", {params: this.params}).pipe(map((data: any) => this.cartData = data)
  		);
  }

  clearCart() {
    // this.items = [];
    // return this.items;
  }

  // getProduct(id: Number){
  // 	return this.items[id]
  // }
}
