package com.hj.product.model.vo;

public class Product {
	private int productNo;// 상품번호
	private String productName;//상품이름
	private String productPrice;//판매가격
	private String productVolume;//용량
	private String productAlcohol; //도수
	private String productStock;//재고
	private String productType;//주종
	private String productDetail;// 상품상세정보
	private String productShow;// 노출상태
	private String productImage1;//이미지1
	private String productImage2;//이미지2
	private String productRate;//상품별점
	private int productCount;//상품수
	private String userProductCount; // 판매량
	private int sale;
	
	
	
	public int getSale() {
		return sale;
	}

	public void setSale(int sale) {
		this.sale = sale;
	}





	private int orderCount;	// 수량

	public int getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}

	public String getUserProductCount() {
		return userProductCount;
	}

	public void setUserProductCount(String userProductCount) {
		this.userProductCount = userProductCount;
	}

	public String getProductStock() {
		return productStock;
	}

	public void setProductStock(String productStock) {
		this.productStock = productStock;
	}

	public String getProductRate() {
		return productRate;
	}

	public void setProductRate(String productRate) {
		this.productRate = productRate;
	}

	public int getProductCount() {
		return productCount;
	}

	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}
	
	

	public Product(int productNo, String productName, String productPrice, String productStock, int sale) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productStock = productStock;
		this.sale = sale;
	}

	public Product(int productNo, String productName, String productPrice, String productVolume, String productAlcohol,
			String productStock, String productType, String productDetail, String productShow, String productImage1,
			String productImage2, String productRate, int productCount) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productVolume = productVolume;
		this.productAlcohol = productAlcohol;
		this.productStock = productStock;
		this.productType = productType;
		this.productDetail = productDetail;
		this.productShow = productShow;
		this.productImage1 = productImage1;
		this.productImage2 = productImage2;
		this.productRate = productRate;
		this.productCount = productCount;
	}

	public Product(int productNo, String productName, String productPrice, String productAlcohol,
			String productImage1) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productAlcohol = productAlcohol;
		this.productImage1 = productImage1;
	}

	public Product() {
		super();
	}

	public Product(int productNo, String productName, String productPrice, String productVolume, String productAlcohol,
			String productStock, String productType, String productDetail, String productShow) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productVolume = productVolume;
		this.productAlcohol = productAlcohol;
		this.productStock = productStock;
		this.productType = productType;
		this.productDetail = productDetail;
		this.productShow = productShow;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductVolume() {
		return productVolume;
	}

	public void setProductVolume(String productVolume) {
		this.productVolume = productVolume;
	}

	public String getProductAlcohol() {
		return productAlcohol;
	}

	public void setProductAlcohol(String productAlcohol) {
		this.productAlcohol = productAlcohol;
	}

	public String getproductStock() {
		return productStock;
	}

	public void setproductStock(String productStock) {
		this.productStock = productStock;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public String getProductDetail() {
		return productDetail;
	}

	public void setProductDetail(String productDetail) {
		this.productDetail = productDetail;
	}

	public String getProductShow() {
		return productShow;
	}

	public void setProductShow(String productShow) {
		this.productShow = productShow;
	}

	public String getProductImage1() {
		return productImage1;
	}

	public void setProductImage1(String productImage1) {
		this.productImage1 = productImage1;
	}

	public Product(int productNo, String productName, String productPrice, String productVolume, String productAlcohol,
			String productStock, String productType, String productDetail, String productShow, String productImage1,
			String productImage2) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productVolume = productVolume;
		this.productAlcohol = productAlcohol;
		this.productStock = productStock;
		this.productType = productType;
		this.productDetail = productDetail;
		this.productShow = productShow;
		this.productImage1 = productImage1;
		this.productImage2 = productImage2;
	}

	public Product(int productNo, String productName, String productPrice, String productVolume, String productAlcohol,
			String productStock, String productType, String productDetail, String productShow, String productImage1) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productVolume = productVolume;
		this.productAlcohol = productAlcohol;
		this.productStock = productStock;
		this.productType = productType;
		this.productDetail = productDetail;
		this.productShow = productShow;
		this.productImage1 = productImage1;
	}

	public String getProductImage2() {
		return productImage2;
	}

	public void setProductImage2(String productImage2) {
		this.productImage2 = productImage2;
	}

	
	
	
	
	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", productName=" + productName + ", productPrice=" + productPrice
				+ ", productVolume=" + productVolume + ", productAlcohol=" + productAlcohol + ", productStock=" + productStock
				+ ", productType=" + productType + ", productDetail=" + productDetail + ", productShow=" + productShow
				+ ", productImage1=" + productImage1 + ", productImage2=" + productImage2 + "]";
	}
	
	
}
