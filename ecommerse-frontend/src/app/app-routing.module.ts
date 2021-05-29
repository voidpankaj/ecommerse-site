import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ProductListComponent } from './product-list/product-list.component';
import { ProductDetailsComponent } from './product-details/product-details.component';
import { CartComponent } from './cart/cart.component';
import { QuotecartComponent } from './quotecart/quotecart.component';
import { HomePageComponent } from './home-page/home-page.component';
import { SignLoginComponent } from './sign-login/sign-login.component';
import { CustomerQuoteComponent } from './customer-quote/customer-quote.component';
import { ShowQuoteRepliesComponent } from './show-quote-replies/show-quote-replies.component';




const routes: Routes = [
  { path: 'collections/:cId', component: ProductListComponent },
  { path: 'products/:productId', component: ProductDetailsComponent },
  { path: 'cart/:cId', component: CartComponent },
  { path: 'qoutecart/:cId', component: QuotecartComponent },
  { path: 'login-page', component: SignLoginComponent },
  { path: 'customer/qoute/:cId', component:CustomerQuoteComponent},
  { path: 'customer/qoute/replies', component:ShowQuoteRepliesComponent},
  { path: '', redirectTo: '/login-page', pathMatch: 'full' }
  // { path: 'home-page/:cId', component: HomePageComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
