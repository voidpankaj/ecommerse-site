import { Injectable } from '@angular/core';
import { Product } from './product';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { map, catchError } from 'rxjs/operators';

@Injectable({
	providedIn: 'root'
})
export class OwnerService {
	private baseUrl = "http://localhost:3000/ecommerse/api/"
	params :any = {};
	ownerData:any;

	constructor(private http: HttpClient) { }

	fetchQuotationRequests(cId: number):Observable<any>{
		this.params = new HttpParams().set('owner_id', cId)
		return this.http.get<any>(this.baseUrl + 'store_owners/fetch_quotation_requests.json', {params: this.params})
	}
}


