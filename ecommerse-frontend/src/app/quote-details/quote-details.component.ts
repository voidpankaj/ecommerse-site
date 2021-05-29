import { Component, OnInit, Input } from '@angular/core';
import { QuotecartService } from '../quotecart.service';


@Component({
  selector: 'app-quote-details',
  templateUrl: './quote-details.component.html',
  styleUrls: ['./quote-details.component.css']
})
export class QuoteDetailsComponent implements OnInit {

	@Input() quote?: any;
	@Input() send_user_id?: any;
	@Input() receiver_user_id?: any;

  constructor(private quotecartService: QuotecartService) { }

  ngOnInit(): void {
  }

  updateQuote(){
  	this.quotecartService.updateQuoteCart(this.quote).subscribe(res => {
  		this.quote = res.cart_data
  		this.quote.show=true
  	})
  }

  addComment(){
  	if(!this.quote.comment){
  		alert("Chatbox is empty!")
  		return 
  	}
  	var params = {
  		"comment":this.quote.comment,
  		"send_user_id": this.send_user_id,
  		"receiver_user_id": this.receiver_user_id,
  		"id": this.quote.id
  	}
  	this.quotecartService.addComment(params).subscribe(res => {
  		this.quote = res.cart_data
  		this.quote.show=true
  	})
  }

}
