/*******************************************************************************
* Copyright (c) 2012 Harman International (http://www.harman.com).
* All rights reserved. This program and the accompanying materials
* are made available under the terms of the Eclipse Public License v1.0
* which accompanies this distribution, and is available at
* http://www.eclipse.org/legal/epl-v10.html
*******************************************************************************/
package org.franca.core.dsl.valueconverter;

import java.math.BigInteger;

import org.eclipse.xtext.common.services.Ecore2XtextTerminalConverters;
import org.eclipse.xtext.conversion.IValueConverter;
import org.eclipse.xtext.conversion.ValueConverter;
import org.eclipse.xtext.conversion.ValueConverterException;
import org.eclipse.xtext.conversion.impl.AbstractNullSafeConverter;
import org.eclipse.xtext.nodemodel.INode;

public class FrancaValueConverters extends Ecore2XtextTerminalConverters {

	@ValueConverter(rule = "E_BigInteger")
	public IValueConverter<BigInteger> E_BigInteger() {
		return new AbstractNullSafeConverter<BigInteger>() {
			@Override
			protected String internalToString(BigInteger value) {
				return value.toString(10);
			}

			@Override
			protected BigInteger internalToValue(String string, INode node)
					throws ValueConverterException {
				BigInteger result;
				try {
					if (string.startsWith("0x") || string.startsWith("0X")) {
						result = new BigInteger(string.substring(2), 16);
					} else {
						result = new BigInteger(string, 10);
					}
					return result;
				} catch (Exception e) {
					throw new ValueConverterException("Not a proper hexadecimal value.", node, e);
				}
			}
		};
	}
	
	@ValueConverter(rule = "ANNOTATION_STRING")
	public IValueConverter<String> ANNOTATION_STRING() {
		return new AbstractNullSafeConverter<String>() {
			@Override
			protected String internalToValue(String string, INode node) {
				String value = string;
				
				// cut trailing whitespace or newlines
				int j = string.length()-1;
				while (j>=0 && Character.isWhitespace(string.charAt(j))) {
					j--;
				}
				
				if (j>=0) {
					value = string.substring(0, j+1);
				}
				return value;
			}

			@Override
			protected String internalToString(String value) {
				return value;
			}
		};
	}
}
