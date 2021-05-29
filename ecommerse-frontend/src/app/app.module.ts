import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ProductListComponent } from './product-list/product-list.component';
import { HomePageComponent } from './home-page/home-page.component';
import { ProductDetailsComponent } from './product-details/product-details.component';
import { HttpClientModule } from '@angular/common/http';
import { CartComponent } from './cart/cart.component';
import { FormsModule } from '@angular/forms';
import { QuotecartComponent } from './quotecart/quotecart.component';
import { SignLoginComponent } from './sign-login/sign-login.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MyQuoteComponent } from './my-quote/my-quote.component';
import { CustomerQuoteComponent } from './customer-quote/customer-quote.component';
import { OwnerQuoteComponent } from './owner-quote/owner-quote.component';
import { ShowQuoteRepliesComponent } from './show-quote-replies/show-quote-replies.component';
// import { MatSliderModule } from '@angular/material/slider';
// import {MatTableModule} from '@angular/material/table';



@NgModule({
  declarations: [
    AppComponent,
    ProductListComponent,
    HomePageComponent,
    ProductDetailsComponent,
    CartComponent,
    QuotecartComponent,
    SignLoginComponent,
    MyQuoteComponent,
    CustomerQuoteComponent,
    OwnerQuoteComponent,
    ShowQuoteRepliesComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    BrowserAnimationsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
