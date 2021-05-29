import { Injectable } from '@angular/core';
import { Product } from './product';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { map, catchError } from 'rxjs/operators';

@Injectable({
	providedIn: 'root'
})
export class CustomerService {
	private baseUrl = "http://localhost:3000/ecommerse/api/"
	params :any = {};
	customerData:any;

	constructor(private http: HttpClient) { }
	
	getItems(cId: number): Observable<any[]>{
		this.params = new HttpParams().set('customer_id', cId)
		return this.http.get<any[]>(this.baseUrl + 'customers/get_licence_items.json', {params: this.params}).pipe(map((data: any) => data.products)
			);
	}

	fetchQuotationRequests(cId: number):Observable<any>{
		this.params = new HttpParams().set('customer_id', cId)
		return this.http.get<any>(this.baseUrl + 'customers/fetch_quotation_requests.json', {params: this.params})
	}
}


