public class HistoryModel {
	String name;
	int quantity;
	double total;
	String order_number;
	
	public HistoryModel(String name, int quantity, double total, String order_number) {
		super();
		this.name = name;
		this.quantity = quantity;
		this.total = total;
		this.order_number = order_number;
	}

	public String getOrder_number() {
		return order_number;
	}

	public void setOrder_number(String order_number) {
		this.order_number = order_number;
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
}
