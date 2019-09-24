package temp;
import dao.*;
import bean.*;
import java.awt.Color;
import java.io.FileOutputStream;
import java.text.DecimalFormat;
import java.util.List;

import com.lowagie.text.Chapter;
import com.lowagie.text.Chunk;
import com.lowagie.text.Document;
import com.lowagie.text.Font;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.BaseFont;
import com.lowagie.text.pdf.PdfWriter;
import java.util.Date;
import java.text.SimpleDateFormat;
public  class write {
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
	private static int normal = Font.NORMAL; // 正常字体
	private static Color black = new Color(0, 0, 0); // 黑色
	private static Color red = new Color(255, 0, 0); // 红色
	private int bold = Font.BOLD; // 粗体
	private Color blue = new Color(0, 0, 255); // 蓝色
	private Color green = new Color(0,255,0);//绿色
	private float setting = 20; // 首行缩进参数
	 static int count=0;//用红色标注的字体个数
	 static int cop_count=0;//用红色标注的片段个数
	 static int sum=0;//总字数
	public static void main(String[] args) throws Exception {
		write pdfDemo = new write();
		pdfDemo.writePdf("F:\\重复率\\check9.pdf");
		System.out.println("success！");
	}
	public static void down() throws Exception
	{
		write pdfDemo = new write();
		pdfDemo.writePdf("F:\\重复率\\check9.pdf");
		System.out.println("success！");
	}

	public static Document createDoc(String filename) throws Exception {

		Document document = new Document(PageSize.A4, 50, 50, 50, 50);
		PdfWriter.getInstance(document, new FileOutputStream(filename));
		return document;
	}

	public void writePdf(String filename) throws Exception {
		Userdao a=new Userdao();
		Document document = createDoc(filename); // 打开文档
		document.open(); // 文档里写入
		Chunk chunk1 = new Chunk(convertChunkToChinese("河北省信息技术手册", 20, bold, black));
		document.add(chunk1);
		document.add(new Paragraph("\n"));
		Chunk chunk2 = new Chunk(convertChunkToChinese("【PDF报告——大学生版】", 15, bold, black));
		document.add(chunk2);
		document.add(new Paragraph("\n"));
		Paragraph t = new Paragraph(convertParToChinese("报告编号：42d24399ae45f987\t\t\t\t\t\t检测时间："+df.format(new Date()), 10, normal, black));
		document.add(t);
		document.add(new Paragraph("\n"));
		Paragraph t1 = new Paragraph(convertParToChinese("作者名称：河北省党政机关\t\t\t\t\t\t所属单位：石家庄铁道大学（河北）", 10, normal, black));
		document.add(t1);
		document.add(new Paragraph("\n"));
		Paragraph t2 = new Paragraph(convertParToChinese("——————————————————————————————————————————————", 10, normal, black));
		document.add(t2);
		Paragraph pp = new Paragraph(convertParToChinese("检测范围：◎百度百科", 9, normal, black));
		document.add(pp);
		document.add(new Paragraph("\n"));
		document.add(t2);
		
		Paragraph t11 = new Paragraph(convertParToChinese("检测结论：", 15, normal, black));
		document.add(t11);
		document.add(new Paragraph("\n"));
		Paragraph a11=new Paragraph();
		a11.add(new Phrase(convertParToChinese("全文总相似比：\t\t", 9, normal, black)));
		a11.add(new Phrase(convertParToChinese("3.21%", 9, normal, red)));
		document.add(a11);
		Paragraph a12=new Paragraph();
		a12.add(new Phrase(convertParToChinese("总相似片段:\t\t", 9, normal, black)));
		a12.add(new Phrase(convertParToChinese("140", 9, normal, red)));
		document.add(a12);
		document.add(new Paragraph("\n"));
		
		document.add(t2);
		Paragraph pp3 = new Paragraph(convertParToChinese("颜色标注说明：", 9, normal, black));
		document.add(pp3);
		document.add(new Paragraph("\n"));
		Paragraph pp31 = new Paragraph(convertParToChinese("■\t\t自写片段", 9, normal, black));
		document.add(pp31);
		Paragraph pp32 = new Paragraph(convertParToChinese("■\t\t复写片段（相似或疑似重复）", 9, normal, red));
		document.add(pp32);
		Paragraph pp33 = new Paragraph(convertParToChinese("■\t\t摘要", 9, normal, blue));
		document.add(pp33);
		document.add(new Paragraph("\n"));
		document.add(t2);
		document.add(new Paragraph("\n"));
		Paragraph pp2 = new Paragraph();
		document.add(pp2);
		List<Userbean> cs = a.getListAll3();
		for (Userbean c : cs) {
			Paragraph chapterTitle = new Paragraph("\n\n");
			Paragraph p0 = new Paragraph(convertParToChinese(c.getId() + "." + c.getTitle3(), 14, bold, black));
			chapterTitle.add(p0);
			Paragraph p3 = new Paragraph(convertParToChinese("类别：" + c.getClasss(), 9, normal, black));
			chapterTitle.add(p3);
			Paragraph p = new Paragraph(convertParToChinese("关键字：" + c.getKey1(), 9, normal, black));
			chapterTitle.add(p);
			Paragraph p4 = new Paragraph(convertParToChinese("摘要：" + c.getAbstract1(), 9, normal, blue));
			chapterTitle.add(p4);
			chapterTitle.add("\n");
			chapterTitle.add("  ");
			Paragraph p2 = returnExpain(c.getId(), c.getContent());// 解释
			chapterTitle.add(p2);
			document.add(chapterTitle);
		}
		document.add(new Paragraph("\n\n"));
		document.add(new Paragraph(convertParToChinese("检测结论：",22, normal, black)));
		Paragraph a1=new Paragraph();
		a1.add(new Phrase(convertParToChinese("全文相似度：", 9, normal, black)));
		sum();
		DecimalFormat decimalFormat=new DecimalFormat(".00");//构造方法的字符格式这里如果小数不足2位,会以0补足.
		String p=decimalFormat.format((float)100*count/sum);
		System.out.println(p);
		a1.add(new Phrase(convertParToChinese(p+"%", 9, normal, red)));
		document.add(a1);
		document.add(new Paragraph(convertParToChinese("总相似片段：" +cop_count, 9, normal, black)));
		document.close();
	}

	public static Paragraph returnExpain(int id, String explain) throws Exception {
		Userdao b=new Userdao();
		int number_copy=0;
		int number_content=0;
		List<Co> copys =b.find_id(id);
		Paragraph a = new Paragraph();
		String word = "";
		int j = 0;

		if (copys.size() != 0) {
			Co c = copys.get(j);
			j++;
			for (int i = 0; i < explain.length(); i++) {
				if (i < c.getStart1()) {
					word = word + explain.charAt(i);
				} else if (i == c.getStart1()) {
					if (word != "") {// 抄袭语句前面的语句
						a.add(new Phrase(convertParToChinese2(word, 12, normal, black)));
						word = "";
					}	
					word = word + explain.charAt(i);
				} else if (i == c.getFinish1()) {
					word = word + explain.charAt(i);
					if (word != "") {// 抄袭语句前面的语句
						cop_count++;
						count=count+word.length();
						number_copy=word.length();
						number_content=explain.length();
						a.add(new Phrase(convertParToChinese2(word, 12, normal, red)));
						//a.add(new Phrase(convertParToChinese("(该抄袭字段所占全文百分比为：", 9, normal, black)));
						DecimalFormat decimalFormat=new DecimalFormat(".00");
						String p1=decimalFormat.format((float)100*count/sum);
						System.out.println(p1);
						//a.add(new Phrase(convertParToChinese(p1+"%)", 9, normal, red)));
						number_copy=0;
						number_content=0;
						word = "";
						if (j < copys.size()) {
							c = copys.get(j);
							j++;
						}
					}
				}else if (i == explain.length()-1) {
					word = word + explain.charAt(i);
					a.add(new Phrase(convertParToChinese2(word, 12, normal, black)));
				}else if(i>explain.length()){
					word = word + explain.charAt(i);
				}else if(i>c.getStart1()&&i<c.getFinish1()) {
					word = word + explain.charAt(i);
				}else if(i>c.getFinish1()) {
					word = word + explain.charAt(i);
				}

			}
		} else {
			a = new Paragraph(convertParToChinese(explain, 12, normal, black));
		}
		return a;

	}
	
	public static void sum() {
		Userdao c=new Userdao();
		List<Userbean> citiaos=c.getListAll3();
		for(Userbean d:citiaos) {
			sum=sum+d.getContent().length();
		}
		
	}
	
	public static Paragraph convertParToChinese(String text, int fontsize, int fontStyle, Color color)
			throws Exception {
		BaseFont baseFontChinese = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
		Font fontChinese = new Font(baseFontChinese, fontsize, fontStyle, color);
		Paragraph graph = new Paragraph(text, fontChinese);
		return graph;
	}

	public static Phrase convertParToChinese2(String text, int fontsize, int fontStyle, Color color) throws Exception {
		BaseFont baseFontChinese = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
		Font fontChinese = new Font(baseFontChinese, fontsize, fontStyle, color);
		Phrase graph = new Phrase(text, fontChinese);
		return graph;
	}

	public static Chunk convertChunkToChinese(String text, int fontsize, int fontStyle, Color color) throws Exception {
		BaseFont baseFontChinese = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
		Font fontChinese = new Font(baseFontChinese, fontsize, fontStyle, color);
		Chunk graph = new Chunk(text, fontChinese);
		return graph;
	}
}
