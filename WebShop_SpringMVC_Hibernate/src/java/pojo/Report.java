package pojo;
// Generated Dec 26, 2016 8:11:13 PM by Hibernate Tools 4.3.1



/**
 * Report generated by hbm2java
 */
public class Report  implements java.io.Serializable {


     private Integer id;
     private int productId;
     private String type;
     private int amount;

    public Report() {
    }

    public Report(int productId, String type, int amount) {
       this.productId = productId;
       this.type = type;
       this.amount = amount;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public int getProductId() {
        return this.productId;
    }
    
    public void setProductId(int productId) {
        this.productId = productId;
    }
    public String getType() {
        return this.type;
    }
    
    public void setType(String type) {
        this.type = type;
    }
    public int getAmount() {
        return this.amount;
    }
    
    public void setAmount(int amount) {
        this.amount = amount;
    }




}


