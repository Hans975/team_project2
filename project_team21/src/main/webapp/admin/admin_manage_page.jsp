<%@ page import="java.net.URLEncoder"%>

<%@page import="com.itwill.team2.domain.Category"%>
<%@page import="com.itwill.team2.domain.Size"%>
<%@page import="com.itwill.team2.domain.Color"%>
<%@page import="com.itwill.team2.domain.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.team2.service.ProductService"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
ProductService productService = new ProductService();
List<Color> colors = productService.colorList();
List<Size> sizes = productService.sizeList();
List<Category> categories = productService.categoryList();
List<Category> subCategories = productService.subCategoryList();
List<Product> products = productService.productListOrderByNo();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 페이지</title>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap">
<link rel="stylesheet" href="./css/admin.css?ver=3">
<script src="./js/admin.js"></script>

<style>
</style>

<script>
	document.addEventListener("DOMContentLoaded", function() {
   			 const urlParams = new URLSearchParams(window.location.search);
   			 const page = urlParams.get('page');
   			 if (page) {
   		   	   loadContent(page);
   			} 
		});
		
		
        function loadContent(page, productNo = null) {
            const mainContent = document.querySelector('.main-content');
            switch(page) {
                case 'product_list':
                    let productListHTML = '<h2>제품 목록</h2>';
                    productListHTML += '<div class="product-list">';
                    <% for(Product product : products) { 
                        String encodedCategoryName = URLEncoder.encode(product.getCategory().getCategoryName(), "UTF-8");
                        String encodedSubCategoryName = URLEncoder.encode(product.getSubCategory().getCategoryName(), "UTF-8");
                        String encodedProductName = URLEncoder.encode(product.getProductName(), "UTF-8");                   
                    %>
                        productListHTML += `
                            <div class="product-item">
                                <div class="product-image-container">
                                    <img src="../image/<%=product.getCategory().getCategoryName()%>/<%=product.getSubCategory().getCategoryName()%>/<%=product.getProductName()%>/<%=product.getProductImages().get(0).getProductImageName()%>" alt="<%= product.getProductName() %>" class="product-image">
                                </div>
                                <div class="product-info">
                                    <p class="product-name"><%= product.getProductName() %></p>
                                    <p class="product-price"><%= String.format("%,d", product.getProductPrice()) %>원</p>
                                    <button class="btn-edit" onclick="loadContent('product_register', <%= product.getProductNo() %>)">수정</button>
                                    <button class="btn-delete" onclick="deleteProduct(<%= product.getProductNo() %>)">삭제</button>
                                </div>
                            </div>
                        `;
                    <% } %>
                    productListHTML += '</div>';
                    mainContent.innerHTML = productListHTML;
                    break;
                case 'product_register':
                    let product = null;
                    if (productNo) {
                        <% for(Product p : products) { %>
                        if (productNo == <%= p.getProductNo() %>) {
                            product = {
                                productName: "<%= p.getProductName() %>",
                                productPrice: <%= p.getProductPrice() %>,
                                categoryNo: <%= p.getCategory().getCategoryNo() %>,
                                subCategoryNo: <%= p.getSubCategory().getCategoryNo() %>,
                                colors: [<% for (Color color : p.getColors()) { %>"<%= color.getColorNo() %>",<% } %>],
                                sizes: [<% for (Size size : p.getSizes()) { %>"<%= size.getSizeNo() %>",<% } %>]
                            };
                        }
                        <% } %>
                    }
                    mainContent.innerHTML = `
                        <h2>${productNo ? '제품 수정' : '제품 등록'}</h2>
                        <form action="/upload" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
                            <div class="form-group">
                                <label for="productName">제품 이름</label>
                                <input type="text" id="productName" name="productName" value="${product ? product.productName : ''}" required>
                            </div>
                            <div class="form-group">
                                <label for="productPrice">가격</label>
                                <input type="number" class="product_price" id="productPrice" name="productPrice" value="${product ? product.productPrice : ''}" required min="0">
                            </div>
                            <div class="form-group button-group">
                                <label>카테고리</label>
                                <%for(int i=0; i < categories.size(); i++){%>
                                    <button type="button" data-field="categoryNo" data-value="<%=categories.get(i).getCategoryNo()%>" onclick="toggleSelection(this)" data-name="<%=categories.get(i).getCategoryName()%>" ${product && product.categoryNo == categories.get(i).getCategoryNo() ? 'class="selected"' : ''}><%=categories.get(i).getCategoryName()%></button>
                                <%}%>
                                    <input type="hidden" id="categoryNo" name="categoryNo" value="${product ? product.categoryNo : ''}">
                            </div>
                            <div class="form-group button-group">
                                <label>하위 카테고리</label>
                                <%for(int i=0; i < subCategories.size(); i++){%>
                                    <button type="button" data-field="subCategoryNo" data-value="<%=subCategories.get(i).getCategoryNo()%>" onclick="toggleSelection(this)" data-name="<%=subCategories.get(i).getCategoryName()%>" ${product && product.subCategoryNo == subCategories.get(i).getCategoryNo() ? 'class="selected"' : ''}><%=subCategories.get(i).getCategoryName()%></button>
                                <%}%>
                                    <input type="hidden" id="subCategoryNo" name="subCategoryNo" value="${product ? product.subCategoryNo : ''}">
                            </div>
                            <div class="form-group button-group">
                                <label>색상</label>
                                <%for(Color color : colors) { %>
                                    <button type="button" data-field="color" data-value="<%=color.getColorNo()%>" data-name="<%=color.getColorName()%>" onclick="toggleMultiSelection(this, 'color')" ${product && product.colors.includes("<%=color.getColorNo()%>") ? 'class="selected"' : ''}><%=color.getColorName()%></button>
                                <%}%>
                                    <input type="hidden" id="color" name="color" value="${product ? product.colors.join(',') : ''}">
                            </div>
                            <div class="form-group button-group">
                                <label>사이즈</label>
                                <%for(Size size : sizes) { %>
                                    <button type="button" data-field="size" data-value="<%=size.getSizeNo()%>" data-name="<%=size.getSizeName()%>" onclick="toggleMultiSelection(this, 'size')" ${product && product.sizes.includes("<%=size.getSizeNo()%>") ? 'class="selected"' : ''}><%=size.getSizeName()%></button>
                                <%}%>
                                    <input type="hidden" id="size" name="size" value="${product ? product.sizes.join(',') : ''}">
                            </div>
                            <div class="form-group">
                                <label>색상 및 사이즈별 수량</label>
                                <div id="quantityInputs" class="quantityInputs"></div>
                            </div>
                            
                            <div class="form-group">
                            <label for="productImages">타이틀 이미지 업로드</label>
                            <input type="file" id="productImages" accept="image/*" name="productTitleImages" multiple onchange="previewImages(this, 'title')">
                            <div id="imagePreview" class="image-preview"></div>
                            <div id="fileNames"></div>
                        </div>

                        <div class="form-group">
                            <label for="detailProductImages">상세 설명 이미지 업로드</label>
                            <input type="file" id="detailProductImages" accept="image/*" name="productDetailImages" multiple onchange="previewImages(this, 'detail')">
                            <div id="detailImagePreview" class="image-preview"></div>
                            <div id="detailFileNames"></div>
                        </div>

                            
                            <div class="btn-container">
                                <button type="submit" class="btn">${productNo ? '제품 수정하기' : '제품 등록하기'}</button>
                            </div>
                        </form>
                    `;
                    break;
                case 'category_management':
                    let categoryManagementHTML = '<h2>카테고리 관리</h2>';
                    categoryManagementHTML += '<div class="category-list">';
                    categoryManagementHTML += '<h3>카테고리 목록</h3>';
                    <% for(Category category : categories) { %>
                        categoryManagementHTML += `
                            <div class="category-item">
                                <span><%= category.getCategoryName() %></span>
                                <button class="btn-edit" onclick="editCategory(<%= category.getCategoryNo() %>)">수정</button>
                            </div>
                        `;
                    <% } %>
                    categoryManagementHTML += '</div>';
                    
                    categoryManagementHTML += '<div class="sub-category-list">';
                    categoryManagementHTML += '<h3>하위 카테고리 목록</h3>';
                    <% for(Category subCategory : subCategories) { %>
                        categoryManagementHTML += `
                            <div class="sub-category-item">
                                <span><%= subCategory.getCategoryName() %></span>
                                <button class="btn-edit" onclick="editSubCategory(<%= subCategory.getCategoryNo() %>)">수정</button>
                            </div>
                        `;
                    <%}%>
                    categoryManagementHTML += '</div>';
                    
                    categoryManagementHTML += '<div class="category-add">';
                    categoryManagementHTML += '<h3>새 카테고리 추가</h3>';
                    categoryManagementHTML += `
                        <form onsubmit="addCategory(event)">
                            <input type="text" id="categoryName" name="categoryName" placeholder="카테고리 이름" required>
                            <button type="submit" class="btn">추가하기</button>
                        </form>
                    `;
                    categoryManagementHTML += '</div>';
                    
                    categoryManagementHTML += '<div class="sub-category-add">';
                    categoryManagementHTML += '<h3>새 하위 카테고리 추가</h3>';
                    categoryManagementHTML += `
                        <form onsubmit="addSubCategory(event)">
                            <input type="text" id="subCategoryName" name="subCategoryName" placeholder="하위 카테고리 이름" required>
                            <button type="submit" class="btn">추가하기</button>
                        </form>
                    `;
                    categoryManagementHTML += '</div>';
                    
                    mainContent.innerHTML = categoryManagementHTML;
                    break;
                case 'option_management':
                    mainContent.innerHTML = '<h2>상품 옵션 관리</h2><p>상품 옵션(색상, 사이즈 등)을 관리할 수 있는 페이지입니다.</p>';
                    break;
                default:
                    mainContent.innerHTML = '<h2>관리자 기능을 선택하세요</h2><p>좌측 메뉴를 사용해 제품을 관리하세요.</p>';
            }
        }

        function toggleMultiSelection(button, fieldId) {
            const field = document.getElementById(fieldId);
            let selectedValues = field.value ? field.value.split(',') : [];
            const value = button.getAttribute('data-value');

            if (selectedValues.includes(value)) {
                selectedValues = selectedValues.filter(v => v !== value);
                button.classList.remove('selected');
            } else {
                selectedValues.push(value);
                button.classList.add('selected');
            }

            field.value = selectedValues.join(',');
            updateQuantityInputs();
        }

        function updateQuantityInputs() {
            const colors = document.getElementById('color').value.split(',').filter(c => c);
            const sizes = document.getElementById('size').value.split(',').filter(s => s);
            const quantityInputsContainer = document.getElementById('quantityInputs');

            quantityInputsContainer.innerHTML = '';

            if (colors.length == 0 || sizes.length == 0) {
                console.log('No colors or sizes selected, skipping quantity inputs update.');
                return;
            }

            colors.forEach(color => {
                let colorName = '';
                document.querySelectorAll('[data-field="color"]').forEach(btn => {
                    if (btn.getAttribute('data-value') == color) {
                        colorName = btn.getAttribute('data-name');
                    }
                });
                if (colorName) {
                    sizes.forEach(size => {
                        let sizeName = '';
                        document.querySelectorAll('[data-field="size"]').forEach(btn => {
                            if (btn.getAttribute('data-value') == size) {
                                sizeName = btn.getAttribute('data-name');
                            }
                        });
                        if (sizeName) {
                            const inputGroup = document.createElement('div');
                            inputGroup.classList.add('quantity-group');
                            const label = document.createElement('label');
                            label.textContent = colorName + ' - ' + sizeName + ' : ';
                            const input = document.createElement('input');
                            input.classList.add('stock');
                            input.type = 'number';
                            input.name = 'stock_' + color + '_' + size;
                            input.min = '0';
                            input.value = '0';
                            inputGroup.appendChild(label);
                            inputGroup.appendChild(input);
                            quantityInputsContainer.appendChild(inputGroup);
                        } else {
                            console.log('Size name not found for size:', size);
                        }
                    });
                } else {
                    console.log('Color name not found for color:', color);
                }
            });
        }
        var allTitleFiles = [];
        var allDetailFiles = [];

        // 파일 미리보기 및 추가
        function previewImages(input, type) {
            var previewContainer, allFiles;

            if (type === 'title') {
                previewContainer = document.getElementById('imagePreview');
                allFiles = allTitleFiles;
            } else {
                previewContainer = document.getElementById('detailImagePreview');
                allFiles = allDetailFiles;
            }

            var files = input.files;
            for (var i = 0; i < files.length; i++) {
                allFiles.push(files[i]);
                var file = files[i];
                var reader = new FileReader();
                reader.onload = function (e) {
                    var previewItem = document.createElement('div');
                    previewItem.classList.add('preview-item');
                    var img = document.createElement('img');
                    img.src = e.target.result;
                    var removeBtn = document.createElement('button');
                    removeBtn.innerHTML = 'x';
                    removeBtn.classList.add('remove-btn');
                    removeBtn.onclick = function () {
                        var index = allFiles.indexOf(file);
                        if (index > -1) {
                            allFiles.splice(index, 1);
                        }
                        previewContainer.removeChild(previewItem);
                    };
                    previewItem.appendChild(img);
                    previewItem.appendChild(removeBtn);
                    previewContainer.appendChild(previewItem);
                };
                reader.readAsDataURL(file);
            }
        }

        // 폼 제출 시 선택된 파일들을 다시 설정
        function validateForm() {
    // 파일 입력을 업데이트하는 부분
    var titleFileInput = document.getElementById('productImages');
    var detailFileInput = document.getElementById('detailProductImages');

    var titleDataTransfer = new DataTransfer();
    var detailDataTransfer = new DataTransfer();

    allTitleFiles.forEach(file => {
        titleDataTransfer.items.add(file);
    });
    titleFileInput.files = titleDataTransfer.files;

    allDetailFiles.forEach(file => {
        detailDataTransfer.items.add(file);
    });
    detailFileInput.files = detailDataTransfer.files;

    return true; // 기본 폼 제출 허용
}


        function addCategory(event) {
            event.preventDefault();
            const categoryName = document.getElementById('categoryName').value;

            // FormData 객체 생성 후 카테고리 이름 추가
            const formData = new FormData();
            formData.append('categoryName', categoryName);

            // fetch API를 사용해 POST 방식으로 category_write_action.jsp에 데이터 전송
            fetch('category_write_action.jsp', {
            	method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: new URLSearchParams({
                    categoryName: categoryName
                })
            })
            .then(response => {
                if (response.ok) {
                    // 성공 시 카테고리 관리 페이지 로드
                    window.location.href = 'admin_manage_page.jsp?page=category_management';
                } else {
                    return response.text().then(text => {
                        throw new Error(text);
                    });
                }
            })
            .catch(error => {
                console.error('카테고리 추가 실패:', error);
            });
        }
		
       
		
        function addSubCategory(event) {
            event.preventDefault();
            const subCategoryName = document.getElementById('subCategoryName').value;

            // FormData 객체 생성 후 하위 카테고리 이름 추가
            const formData = new FormData();
            formData.append('subCategoryName', subCategoryName);

            // fetch API를 사용해 POST 방식으로 sub_category_write_action.jsp에 데이터 전송
            fetch('sub_category_write_action.jsp', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: new URLSearchParams({
                    subCategoryName: subCategoryName
                })
            })
            .then(response => {
                if (response.ok) {
                    // 성공 시 카테고리 관리 페이지 로드
                    window.location.href = 'admin_manage_page.jsp?page=category_management';
                } else {
                    return response.text().then(text => {
                        throw new Error(text);
                    });
                }
            })
            .catch(error => {
                console.error('하위 카테고리 추가 실패:', error);
            });
        }

        function editCategory(categoryNo) {
            console.log('카테고리 수정:', categoryNo);
            // 카테고리 수정 로직 구현
        }

        function editSubCategory(subCategoryNo) {
            console.log('하위 카테고리 수정:', subCategoryNo);
            // 하위 카테고리 수정 로직 구현
        }

    </script>
</head>
<body>
	<div class="container">
		<div class="menu">
			<div class="menu-header">관리자 페이지</div>
			<a onclick="loadContent('product_list')">제품 목록</a> <a
				onclick="loadContent('product_register')">제품 등록</a> <a
				onclick="loadContent('category_management')">카테고리 관리</a> <a
				onclick="loadContent('option_management')">상품 옵션 관리</a>
            <a onclick="window.location.href='../user_logout_action.jsp'">로그아웃</a>
		</div>
		<div class="main-content">
			<h2>관리자 기능을 선택하세요</h2>
			<p>좌측 메뉴를 사용해 제품을 관리하세요.</p>
		</div>
	</div>
</body>
</html>