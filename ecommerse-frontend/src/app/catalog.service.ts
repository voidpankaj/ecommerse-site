import { Injectable } from '@angular/core';
import { Product } from './product';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { map, catchError } from 'rxjs/operators';



@Injectable({
  providedIn: 'root'
})
export class CatalogService {

	private baseUrl = "http://localhost:3000/ecommerse/api/"
	params :any = {};
  // private catalogsUrl = 'http://localhost:3000/ecommerse/api/catalogs.json';
  // private catalogShowUrl = 'http://localhost:3000/ecommerse/api/catalogs.json';


	constructor(private http: HttpClient) { }
  // items: any[] = [];

  // addToCart(product: Product) {
  //   this.items.push(product);
  // }

  getItems(page: number, page_no: number, c_id: number): Observable<any[]>{
  	this.params = new HttpParams().set('page', page).set('per_page', page_no).set('customer_id', c_id)

  	return this.http.get<any[]>(this.baseUrl + 'catalogs.json', {params: this.params}).pipe(map((data: any) => data.products)
  		);
  }

  // getItem(): Observable<any>{
  // 	return this.http.get<any>(this.catalogShowUrl).pipe(map((data: any) => data.products[0])
  // 		);
  // }


  // clearCart() {
  //   this.items = [];
  //   return this.items;
  // }
}
