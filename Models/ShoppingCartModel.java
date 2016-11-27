public class ShoppingCartModel {
	String name;
	int quantity;
	double price;
	double total;
	int id;
	
	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public ShoppingCartModel(String name, int quantity,double price, double total, int id) {
		super();
		this.name = name;
		this.quantity = quantity;
		this.price = price;
		this.total = total;
		this.id = id;
	}
}

