package com.wxy.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		File file;
		int maxFileSize = 5000 * 1024;
		int maxMemSize = 5000 * 1024;
		String filePath = request.getRealPath("/images/");
		PrintWriter out=response.getWriter();

		// ��֤�ϴ�����������
		String contentType = request.getContentType();
		if ((contentType.indexOf("multipart/form-data") >= 0)) {

			DiskFileItemFactory factory = new DiskFileItemFactory();
			// �����ڴ��д洢�ļ������ֵ
			factory.setSizeThreshold(maxMemSize);
			// ���ش洢�����ݴ��� maxMemSize.
			factory.setRepository(new File("c:\\temp"));

			// ����һ���µ��ļ��ϴ��������
			ServletFileUpload upload = new ServletFileUpload(factory);
			// ��������ϴ����ļ���С
			upload.setSizeMax(maxFileSize);
			try {
				// ������ȡ���ļ�
				List fileItems = upload.parseRequest(request);
				
				// �����ϴ����ļ�
				Iterator i = fileItems.iterator();
				out.println("<html>");
				out.println("<head>");
				out.println("<title>JSP File upload</title>");
				out.println("</head>");
				out.println("<body>");
				while (i.hasNext()) {
					FileItem fi = (FileItem) i.next();
					if (!fi.isFormField()) {
						// ��ȡ�ϴ��ļ��Ĳ���
						String fieldName = fi.getFieldName();
						String fileName = fi.getName();
						boolean isInMemory = fi.isInMemory();
						long sizeInBytes = fi.getSize();
						// д���ļ�
						if (fileName.lastIndexOf("\\") >= 0) {
							file = new File(filePath,
									fileName.substring(fileName
											.lastIndexOf("\\")));
						} else {
							file = new File(filePath,
									fileName.substring(fileName
											.lastIndexOf("\\") + 1));
						}
						fi.write(file);
						out.println("Uploaded Filename: " + filePath
								+ fileName + "<br>");
					}
				}
				out.println("</body>");
				out.println("</html>");
			} catch (Exception ex) {
				System.out.println(ex);
			}
		} else {
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet upload</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<p>No file uploaded</p>");
			out.println("</body>");
			out.println("</html>");
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}

}
