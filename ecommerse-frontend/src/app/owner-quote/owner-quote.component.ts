import { Component, OnInit } from '@angular/core';
import { OwnerService } from '../owner.service';
import { ActivatedRoute } from '@angular/router';

@Component({
	selector: 'app-owner-quote',
	templateUrl: './owner-quote.component.html',
	styleUrls: ['./owner-quote.component.css']
})
export class OwnerQuoteComponent implements OnInit {

	constructor(public ownerService: OwnerService, private route: ActivatedRoute) { }
	ownerId:any;
	ngOnInit(): void {
		this.ownerId = Number(this.route.snapshot.paramMap.get('cId'));
		this.fetchRequests();
	}

	fetchRequests(){
		this.ownerService.fetchQuotationRequests(this.ownerId).subscribe(res => {
			this.ownerService.ownerData = res.data
		})
	}

	viewDetails(quote:any){
		quote.show = !quote.show
	}

}
