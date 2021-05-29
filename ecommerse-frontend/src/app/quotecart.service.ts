import { Injectable } from '@angular/core';
import { Product } from './product';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { map, catchError } from 'rxjs/operators';



@Injectable({
  providedIn: 'root'
})

export class QuotecartService {

	// private catalogsUrl = 'http://localhost:3000/ecommerse/api/catalogs.json?page=2&per_page=50';
	private baseUrl = "http://localhost:3000/ecommerse/api/"
	params :any = {};

	constructor(private http: HttpClient) { 
	}

  cartData:any = {};

  addToQuoteCart(params: any):Observable<any> {
    return this.http.post<any>(this.baseUrl + "quotation_requests/add_to_qoute_cart.json", params)
  }

  getQouteCartData(cId: number): Observable<any>{
  	this.params = new HttpParams().set('customer_id', cId)
  	return this.http.get<any>(this.baseUrl + "quotation_requests/fetch_draft_quote_request.json", {params: this.params});
  }

  submitQuoteCart(params: any):Observable<any>{
  	return this.http.post<any>(this.baseUrl + "quotation_requests/submit_quote_request.json", params)
  }

  updateQuoteCart(params: any):Observable<any>{
  	return this.http.post<any>(this.baseUrl + "quotation_requests/update_quote_request.json", params)
  }

  addComment(params: any):Observable<any>{
  	return this.http.post<any>(this.baseUrl + "quotation_requests/add_comment.json", params)
  }

  clearCart() {
    // this.items = [];
    // return this.items;
  }
}

