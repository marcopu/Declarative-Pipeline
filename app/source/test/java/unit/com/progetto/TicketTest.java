package com.progetto;

import static org.junit.Assert.*;

import org.junit.Test;

import com.progetto.Ticket;

public class TicketTest {

	@Test 
	public void test1() {
		Ticket instance = new Ticket();
		String customer = "Consulente Pippo";
		instance.setCustomerName(customer);
		assertEquals(instance.getCustomerName(), customer);
	}

	@Test 
	public void test2() {
		Ticket instance = new Ticket();
		instance.setCustomerName("Consulente Paperino");
		String customer = instance.getCustomerName();
		assertEquals(customer, "Consulente Paperino");
	}
}
