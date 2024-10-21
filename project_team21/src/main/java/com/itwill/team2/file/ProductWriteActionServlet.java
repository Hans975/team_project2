package com.itwill.team2.file;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.UUID;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import jakarta.websocket.Session;

import com.itwill.team2.domain.Category;
import com.itwill.team2.domain.Color;
import com.itwill.team2.domain.Product;
import com.itwill.team2.domain.ProductImage;
import com.itwill.team2.domain.Size;
import com.itwill.team2.domain.Stock;
import com.itwill.team2.service.ProductService;
import com.itwill.team2.Mybatis.ProductDaoImplMyBatis;

@MultipartConfig( fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 10)
@WebServlet("/upload")
public class ProductWriteActionServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	 response.setContentType("text/html;charset=utf-8");
        // 업로드 경로 설정

        try {
        	// 파라미터 수집
            String productName = request.getParameter("productName");
            String productPriceStr = request.getParameter("productPrice");
            String categoryNoStr = request.getParameter("categoryNo");
            String subCategoryNoStr = request.getParameter("subCategoryNo");
            String[] selectedColors = request.getParameter("color").split(",");
            String[] selectedSizes = request.getParameter("size").split(",");
            
            System.out.println("productName : "+productName);
            System.out.println("productPriceStr : "+productPriceStr);
            System.out.println("categoryNoStr : "+ categoryNoStr);
            System.out.println("subcategoryNoStr : "+ subCategoryNoStr);

            // 입력값 체크 및 변환
            if (productName == null || productPriceStr == null ||
                    categoryNoStr == null || subCategoryNoStr == null ||
                    selectedColors == null || selectedSizes == null) {
                response.getWriter().println("<script>alert('모든 필드를 입력해주세요.'); history.back();</script>");
                return;
            }

            int productPrice = Integer.parseInt(productPriceStr);
            int categoryNo = Integer.parseInt(categoryNoStr);
            int subCategoryNo = Integer.parseInt(subCategoryNoStr);
            String categoryName = categoryNo == 1 ? "남성" : "여성";
            String subCategoryName = subCategoryNo == 1 ? "아우터" : subCategoryNo == 2 ? "상의" : "하의";

            // 업로드 경로 설정
            String uploadPath = getServletContext().getRealPath("/image/" + categoryName + "/" + subCategoryName + "/" + productName + "/");
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            // Product 객체 생성
            Product product = Product.builder().productName(productName).productPrice(productPrice).productSales(0)
                    .category(Category.builder().categoryNo(categoryNo).build())
                    .subCategory(Category.builder().categoryNo(subCategoryNo).build())
                    .build();

            // Color, Size, Stock 객체 생성
         // 색상 및 사이즈별 수량 처리
            List<Stock> stockList = new ArrayList<>();
            List<Color> colorList = new ArrayList<>();  // 제품에 추가할 색상 리스트
            List<Size> sizeList = new ArrayList<>();    // 제품에 추가할 사이즈 리스트

            for (String colorStr : selectedColors) {
                int colorNo = Integer.parseInt(colorStr);
                Color color = new Color(colorNo);
                if (!colorList.contains(color)) {
                    colorList.add(color);  // 색상 리스트에 추가
                }

                for (String sizeStr : selectedSizes) {
                    int sizeNo = Integer.parseInt(sizeStr);
                    Size size = new Size(sizeNo);
                    if (!sizeList.contains(size)) {
                        sizeList.add(size);  // 사이즈 리스트에 추가
                    }

                    String stockQtyStr = request.getParameter("stock_" + colorStr + "_" + sizeStr);
                    if (stockQtyStr != null && !stockQtyStr.isEmpty()) {
                        int stockQty = Integer.parseInt(stockQtyStr);
                        Stock stock = new Stock(stockQty, color, size);
                        stockList.add(stock);  // Stock 객체 생성 후 리스트에 추가
                    }
                }
            }
            List<ProductImage> productImages = new ArrayList<>();
            Collection<Part> fileParts = request.getParts(); // 모든 파일들 가져오기

            // 타이틀 이미지 처리
            for (Part filePart : fileParts) {
                if (filePart.getName().equals("productTitleImages") && filePart.getSize() > 0) {
                    String originalFileName = filePart.getSubmittedFileName();
                    if (originalFileName != null && !originalFileName.trim().isEmpty()) {
                        filePart.write(uploadPath + File.separator + "TITLE_1_" + originalFileName);
                        productImages.add(new ProductImage(0, "TITLE_1_" + originalFileName, null)); // 타이틀 이미지 추가
                        System.out.println("Processing title image: " + originalFileName);
                    }
                }
            }

            // 일반 프로덕트 이미지 처리 (동일한 이름의 여러 파일 처리)
            for (Part filePart : fileParts) {
                if (filePart.getName().equals("productDetailImages") && filePart.getSize() > 0) {
                    String originalFileName = filePart.getSubmittedFileName();
                    if (originalFileName != null && !originalFileName.trim().isEmpty()) {
                        filePart.write(uploadPath + File.separator + "DETAIL_1_" + originalFileName);
                        System.out.println("Processing detail image: " + originalFileName);
                        productImages.add(new ProductImage(0, "DETAIL_1_"+originalFileName, null));  // 일반 프로덕트 이미지 추가
                    }
                }
            }


            
         // ProductService를 통해 Product, Stock, Image 저장
            ProductService productService = new ProductService();
            product.setColors(colorList);  // 색상 리스트 설정
            product.setSizes(sizeList);    // 사이즈 리스트로 세팅
            product.setStocks(stockList);          // 수량에 맞는 Stock 세팅
            product.setProductImages(productImages);  // 이미지 리스트 세팅

            productService.productInsert(product);
            
            
//            response.getWriter().println("<script>alert('제품이 성공적으로 등록되었습니다.'); location.href='prodDetails.jsp?productNo=" + product.getProductNo() + "';</script>");
            response.getWriter().println("<script>alert('제품이 성공적으로 등록되었습니다.'); location.href='admin/admin_manage_page.jsp?page=product_list';</script>");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<script>alert('제품 등록 중 오류가 발생했습니다.'); history.back();</script>");
        }
    }
}
