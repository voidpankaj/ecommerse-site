import { Injectable } from '@angular/core';
import { Product } from './product';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { map, catchError } from 'rxjs/operators';



@Injectable({
  providedIn: 'root'
})
export class CatalogService {

  private catalogsUrl = 'http://localhost:3000/ecommerse/api/catalogs.json';
  private catalogShowUrl = 'http://localhost:3000/ecommerse/api/catalogs.json';

	constructor(private http: HttpClient) { }

  // items: any[] = [];

  // addToCart(product: Product) {
  //   this.items.push(product);
  // }

  getItems(): Observable<any[]>{
  	return this.http.get<any[]>(this.catalogsUrl).pipe(map((data: any) => data.products)
  		);
  }

  getItem(): Observable<any>{
  	return this.http.get<any>(this.catalogShowUrl).pipe(map((data: any) => data.products[0])
  		);
  }


  // clearCart() {
  //   this.items = [];
  //   return this.items;
  // }
}
