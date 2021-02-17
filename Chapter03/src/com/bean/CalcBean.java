package com.bean;

import java.io.Serializable;

public class CalcBean implements Serializable {
	private static final long serialVersionUID = 1L;

	public int calculate(int x) {
		return (x*x*x);
	}
}
