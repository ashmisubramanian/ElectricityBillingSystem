import javax.swing.*;

import java.awt.event.*;
import java.awt.*;

import java.sql.*;
import java.io.*;
import java.lang.Exception;



class Imag extends JPanel 
{

	JPanel p;
	Image img ;
	Imag()
	{ 
		p=new JPanel();
		setPreferredSize(new Dimension(200,350));
		img = new ImageIcon("C:\\Users\\MY PC\\Pictures\\jobs.jpg").getImage();
	}

 	public void paintComponent(Graphics g)
	{
		g.drawImage(img,0,0,200,350,this);
	}
}


public class Login implements ActionListener
{
	JFrame f;
	JLabel l,l1,l2;
	JButton b1,b2,b3;
	JPanel p,pl,p1,p2,pb,plr;
	JTextField tf1,tf2;
	Font ft,ft1;
	void connect()
	{
		String un=" ";
		String pf1=" ";
		String cn=tf1.getText();
		String mb=tf2.getText();
		Connection c=null;
	      	Statement s=null;
      		ResultSet rs=null;
		try
		{	
			Class.forName("oracle.jdbc.driver.OracleDriver");
	       		c=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE","xe","xe");
	       		s=c.createStatement();
       			rs=s.executeQuery("select * from details where consumerno='"+cn+"'");
       			while(rs.next())
       			{
        			un=rs.getString("consumerno");
         			un=un.trim();
         			pf1=rs.getString("mobile_no");
         			pf1=pf1.trim();
       			}
       			if((cn.equals(un))&&(mb.equals(pf1)))
       			{
        			f.dispose(); 
		       		Printprofile pp=new Printprofile();
        			pp.printprofile();
       			}
       			else
       			{
        			JOptionPane.showMessageDialog(f, "Invalid Consumer Number or Moblie Number!");
        			tf1.setText("");
        			tf2.setText("");
       			}
   			/*else if(e.getSource()==b3)
    			{
     				f.dispose();
     				Registration r=new Registration();
     				r.registration();
    			}*/
    			/*else
    			{
     				tf1.setText("");
     				tf2.setText("");
    			}*/
		}
		catch(SQLException ae)
      		{
			System.out.println(ae);
 		}
		catch(ClassNotFoundException ee)
		{
			System.out.println(ee);
		}	
		catch(NumberFormatException eee)
      		{
			System.out.println(eee);
 		}
	
	}
	//Imag i;
	public void login()
	{
		f =new JFrame();
		p= new JPanel();
 		pl= new JPanel();
		p1= new JPanel();
		p2= new JPanel();
		plr= new JPanel();
 		l= new JLabel("LOGIN");
		l1= new JLabel("Consumer Number  :");	
		p1.add(l1);
		l2= new JLabel("Moblie Number         :");
		p2.add(l2);
		ft = new Font("TimesRoman",Font.BOLD,35);
		l.setFont(ft);
		l.setForeground(new Color(3, 98, 252)); pl.add(l);
		//i= new Imag();
		//f.add(i,BorderLayout.EAST);
		tf1= new JTextField(10);
		p1.add(tf1);
		tf2= new JTextField(10);
		p2.add(tf2);
		b3= new JButton("new user? create an account .");
      		b3.addActionListener(this);
		ft1 = new Font("Helvetica",Font.BOLD,12);
		b3.setFont(ft1);
		b3.setForeground(new Color(3, 161, 252));
		plr.add(b3);
		//f.add(i);
		p.add(pl);
		p.add(p1);
 		p.add(p2);
		pb= new JPanel();
		b1 = new JButton("Login");
		b1.addActionListener(this);
		b1.setBackground(new Color(32, 102, 168));
		b1.setForeground(Color.WHITE);
		b1.setPreferredSize(new Dimension(80,30));	
		pb.add(b1);
		b2 = new JButton("Cancel");
      		b2.addActionListener(this);
		b2.setBackground(Color.RED);
		b2.setForeground(Color.WHITE);
		b2.setPreferredSize(new Dimension(80,30));
      		pb.add(b2);
		p.add(pb);
		p.add(plr);
		f.add(p);
		p.setLayout(new GridLayout(6,1));
		f.setLayout(new FlowLayout());
		f.setSize(404,385);
		f.setVisible(true);
		f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
	public void actionPerformed(ActionEvent e)
	{
    		if(e.getSource()==b1)
    		{
			connect();
		}
		else
       		{
        		JOptionPane.showMessageDialog(f, "Invalid Username or Password");
        		tf1.setText("");
        		tf2.setText("");
       		}
	}
	
	public static void main(String[]args)

	{
    		Login l = new Login();
    		l.login();
	}
}

class Printprofile implements ActionListener
{
	String nm=new String();
	String cn=new String();
	String ge=new String();
	String dte=new String();
	String adr=new String();
	String em=new String();
	String mn=new String();
	String ps=new String();
	String u=new String();
        Connection c=null;
        Connection cp=null;
        Statement s=null;
        Statement st=null;
        ResultSet rs=null;
        ResultSet rp=null;
        Connection cj=null;
        Statement sj=null;
        ResultSet rj=null;
	//DefaultTableModel dt=new DefaultTableModel();
	//JTable jt=new JTable();
	JFrame f;
	JLabel l,l1,l2,l7,l3,l4,l5,l6,l8;
	JButton b1,b2,b3;
	JRadioButton br1,br2;
	JPanel p,pl,p1,p2,pb,p7,p3,p4,p5,p6,p8,pc;
	JTextField tf1,tf2,tf3,tf4,tf5,tf6;
	Font ft,ft1;
	//String x=new String();
	/*public Printprofile()
	{
		x=us;
	}*/
	public void printprofile()
	{
		/*try
		{
        		Class.forName("org.postgresql.Driver");
			c=DriverManager.getConnection("jdbc:postgresql://ziggy.db.elephantsql.com/ugbdlvhb","ugbdlvhb","4fFRyTvah3x699uZUcE2FdAk7K2ujeB9");
			s=c.createStatement();
			cp=DriverManager.getConnection("jdbc:postgresql://ziggy.db.elephantsql.com/agvzuvwg","agvzuvwg","FQmwfrWZ3WBpkj9g5aoNf_kUUUTsidqn");
			st=cp.createStatement();
			while(rp.next())
			{
				u=rp.getString("consumerno");
				u=u.trim();
			}
			while(rs.next())
			{
				nm=rs.getString("name");
				nm=nm.trim();
				cn=rs.getString("consumerno");
        			cn=cn.trim();
        			ge=rs.getString("gender");
        			ge=ge.trim();
        			dte=rs.getString("dateofconnection");
        			dte=dte.trim();
        			adr=rs.getString("Address");
        			adr=adr.trim();
        			em=rs.getString("email");
        			em=em.trim();
        			mn=rs.getString("num");
        			mn=mn.trim();
				ps=rs.getString("payment_status");
				ps=ps.trim();
			}
		}
		catch(Exception ae)
		{
      		}*/
      		f=new JFrame();
		p=new JPanel();
		pl= new JPanel();
		p1= new JPanel();
		p2= new JPanel();
		p3= new JPanel();
		p4= new JPanel();
		p5= new JPanel();
		p6= new JPanel();
		p7= new JPanel();
		p8= new JPanel();
		l= new JLabel("My Profile");
		ft = new Font("TimesRoman",Font.BOLD,35);
		l.setFont(ft);
		l.setForeground(new Color(3, 98, 252));
		pl.add(l);
		l1= new JLabel("Name                                       :   "+nm);
		p1.add(l1);
		l2= new JLabel("Consumer Number               :   "+cn);
		p2.add(l2);
		l7= new JLabel("Gender                                    :   "+ge);
		p7.add(l7);
		l3= new JLabel("Date of Connection              :   "+dte);
		p3.add(l3);
		l4= new JLabel("Current Address                   :   "+adr);
		p4.add(l4);
		l5= new JLabel("Email                                       :   "+em);
		p5.add(l5);
		l6= new JLabel("Mobile Number                      :   "+em);
		p6.add(l6);
		l8= new JLabel("Payment Status                    :   "+ps);
		p8.add(l8);
		p.add(pl);
		p.add(p1);
		p.add(p2);
		p.add(p7);
		p.add(p3);
		p.add(p4);
		p.add(p5);
		p.add(p6);
		p.add(p8);
		pb= new JPanel();
		b1 = new JButton("History");
		b1.setBackground(new Color(32, 102, 168));
		b1.setForeground(Color.WHITE);
		b1.setPreferredSize(new Dimension(80,30));
		pb.add(b1);
		b3 = new JButton("Bill");
		b3.setBackground(new Color(32, 102, 168));
		b3.setForeground(Color.WHITE);
		b3.setPreferredSize(new Dimension(80,30));
		pb.add(b3);
		b2 = new JButton("Logout");
		b2.setBackground(Color.RED);
		b2.setForeground(Color.WHITE);
		b2.setPreferredSize(new Dimension(80,30));
		pb.add(b2);
		pc= new JPanel();
      		b1.addActionListener(this);
      		b2.addActionListener(this);
      		b3.addActionListener(this);
		p.add(pb);
		p.add(pc);
		f.add(p);
		p.setLayout(new GridLayout(11,1));
		f.setLayout(new FlowLayout());
		f.setSize(400,700);
		f.setVisible(true);
 		f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
	public void actionPerformed(ActionEvent e)
	{
		if(e.getSource()==b3)
		{
      			f.dispose();
     			Paybill p1=new Paybill();
    		  	p1.paybill();
    		}
    		/*else if(e.getSource()==b3)
    		{
     			try
      			{
          			st.executeUpdate("delete from details where username='"+u+"';");
      				s.executeUpdate("delete from checkprofile where username='"+un+"';");
    			}
    			catch(SQLException aee){ }
   			f.dispose();
     			Login l=new Login();
     			l.login();
    		}
    		else if(e.getSource()==b2)
    		{
     			f.dispose();
     			Login l=new Login();
     			l.login();
    		}
    		else if(e.getSource()==b4)
    		{
     			f.dispose();
     			Portal po=new Portal(x);
     			po.portal();
    		}*/
   	} 

} 

/*class Finance implements ActionListener
{
	JFrame f;
	JButton ba1,ba2;
	JLabel jl1,jl2,jl3,jl4,jl5,jl6,jl7,jl8,jl9,jl10;
	JPanel p1,p2;
	public void finance()
	{
		f=new JFrame("Finance");
		ba1=new JButton("Apply");
		ba1.addActionListener(this);
        	p1=new JPanel();
	        p1.setLayout(new FlowLayout());
	        ba1.setBackground(Color.BLUE);
	        ba1.setForeground(Color.WHITE);
	        jl1=new JLabel("*Accounting Taxation");
	        jl1.setFont(new Font("Verdana",Font.PLAIN,20));
	        jl2=new JLabel("                 Sri Consulting,Bangalore                ");
	        jl2.setFont(new Font("Verdana",Font.PLAIN,15));
 	        jl3=new JLabel("B.Com,CA,ICWA      ");
	        jl3.setFont(new Font("Verdana",Font.PLAIN,15));
	        jl4=new JLabel("    7500 Monthly      ");
	        jl4.setFont(new Font("Verdana",Font.PLAIN,15));
  	        jl5=new JLabel("                   Freshers                             ");
	        jl5.setFont(new Font("Verdana",Font.PLAIN,15));
 	        p1.add(jl1); p1.add(jl2); p1.add(jl3); p1.add(jl4); p1.add(jl5);
	        p1.add(ba1);
	        p1.setBounds(10,10,300,200);
	        f.add(p1);
	        f.setSize(500,500);
	        f.setLayout(new BorderLayout());
	        f.setVisible(true);
	        f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
	
	public void actionPerformed(ActionEvent e)
	{
     		if(e.getSource()==ba1)
     		{
      			f.dispose();
      			Paybill p1=new Paybill();
    		  	p1.paybill();
     		}
    	}
}*/

class Paybill implements ActionListener
{
	JTextField tf1;
	JFrame f;
	JButton ba1,ba2;
	JLabel jl1,jl2,jl3,jl4,jl5,jl6,jl7,jl8,jl9,jl10;
	JPanel p1,p2;
    	JPasswordField pf;
	public void paybill()
	{
	        f=new JFrame("Payment");
	        ba1=new JButton("Pay Now");
		ba2=new JButton("Cancel");
		ba2.addActionListener(this);
                ba1.addActionListener(this);
                p1=new JPanel();
		ba2.setBackground(Color.BLUE);
		ba2.setForeground(Color.WHITE);
	        p1.setLayout(new FlowLayout());
	        ba1.setBackground(Color.BLUE);
	        ba1.setForeground(Color.WHITE);
	        jl1=new JLabel("*Accounting Taxation");
	        jl1.setFont(new Font("Verdana",Font.PLAIN,20));
 	        jl2=new JLabel("                 Sri Consulting,Bangalore                ");
	        jl2.setFont(new Font("Verdana",Font.PLAIN,15));
 	        jl3=new JLabel("B.Com,CA,ICWA      ");
	        jl3.setFont(new Font("Verdana",Font.PLAIN,15));
	        jl4=new JLabel("    7500 Monthly      ");
	        jl4.setFont(new Font("Verdana",Font.PLAIN,15));
  	        jl5=new JLabel("                   Freshers                             ");
	        jl5.setFont(new Font("Verdana",Font.PLAIN,15));
 	        p1.add(jl1); p1.add(jl2); p1.add(jl3); p1.add(jl4); p1.add(jl5);
	        p1.add(ba1);
	        p1.setBounds(10,10,300,200);
	        f.add(p1);
	        f.setSize(500,500);
	        f.setLayout(new BorderLayout());
	        f.setVisible(true);
	        f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
	public void actionPerformed(ActionEvent e)
	{
     		if(e.getSource()==ba1)
		{
 			f.dispose();
 			int a=JOptionPane.showConfirmDialog(f, "Are you sure?");
        		if(a==JOptionPane.YES_OPTION)
			{
				JOptionPane.showMessageDialog(f, "Payment is successfull!");
				Printprofile p=new Printprofile();
				p.printprofile();
			}
			else
			{
				Paybill p1=new Paybill();
				p1.paybill();
			}
		}
     
    	}
}