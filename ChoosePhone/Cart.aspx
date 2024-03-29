﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="ChoosePhone.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="container">
		<div class="card shopping-cart">
			<div class="card-header bg-dark text-light">
				<i class="fa fa-shopping-cart" aria-hidden="true" style="font-size: 32px"></i>
				<label>Shopping Cart</label>
				<div class="clearfix"></div>
			</div>
			<div class="card-body">
				<!-- PRODUCT -->
				<div class="row">
					<div class="col-12 col-sm-12 col-md-2 text-center">
						<img class="img-responsive" src="http://placehold.it/120x80" alt="prewiew" width="120" height="80">
					</div>
					<div class="col-12 text-sm-center col-sm-12 text-md-left col-md-6">
						<h4 class="product-name"><strong>Product Name</strong></h4>
						<h4>
							<small>Product description</small>
						</h4>
					</div>
					<div class="col-12 col-sm-12 text-sm-center col-md-4 text-md-right row">
						<div class="col-3 col-sm-3 col-md-6 text-md-right" style="padding-top: 5px">
							<h6><strong>25.00 <span class="text-muted">x</span></strong></h6>
						</div>
						<div class="col-4 col-sm-4 col-md-4">
							<div class="quantity">
								<input type="button" value="+" class="plus">
								<input type="number" step="1" max="99" min="1" value="1" title="Qty" class="qty"
									size="4">
								<input type="button" value="-" class="minus">
							</div>
						</div>
						<div class="col-2 col-sm-2 col-md-2 text-right">
							<button type="button" class="btn btn-outline-danger btn-xs">
								<i class="fa fa-trash" aria-hidden="true"></i>
							</button>
						</div>
					</div>
				</div>
				<hr>
				<!-- END PRODUCT -->
				<!-- PRODUCT -->
				<div class="row">
					<div class="col-12 col-sm-12 col-md-2 text-center">
						<img class="img-responsive" src="http://placehold.it/120x80" alt="prewiew" width="120" height="80">
					</div>
					<div class="col-12 text-sm-center col-sm-12 text-md-left col-md-6">
						<h4 class="product-name"><strong>Product Name</strong></h4>
						<h4>
							<small>Product description</small>
						</h4>
					</div>
					<div class="col-12 col-sm-12 text-sm-center col-md-4 text-md-right row">
						<div class="col-3 col-sm-3 col-md-6 text-md-right" style="padding-top: 5px">
							<h6><strong>25.00 <span class="text-muted">x</span></strong></h6>
						</div>
						<div class="col-4 col-sm-4 col-md-4">
							<div class="quantity">
								<input type="button" value="+" class="plus">
								<input type="number" step="1" max="99" min="1" value="1" title="Qty" class="qty"
									size="4">
								<input type="button" value="-" class="minus">
							</div>
						</div>
						<div class="col-2 col-sm-2 col-md-2 text-right">
							<button type="button" class="btn btn-outline-danger btn-xs">
								<i class="fa fa-trash" aria-hidden="true"></i>
							</button>
						</div>
					</div>
				</div>
				<hr>
				<!-- END PRODUCT -->
			</div>
			<div class="card-footer">
				<div class="coupon col-md-5 col-sm-5 no-padding-left pull-left">
					<div class="row">
						<div class="col-6">
							<input type="text" class="form-control" placeholder="Nhập mã giảm giá">
						</div>
						<div class="col-6">
							<input type="submit" class="btn btn-default" style="background-color:#f2b02a" value="Áp dụng">
						</div>
					</div>
				</div>
				<div class="pull-right col-3 text-center" style="margin: 10px">

					<div class="row text-right col" style="margin: 10px">
						<h6>Total price: <b>50.00€</b></h6>
					</div>
					<a href="" class="btn btn-success row">Checkout</a>
				</div>
			</div>
		</div>
</asp:Content>

