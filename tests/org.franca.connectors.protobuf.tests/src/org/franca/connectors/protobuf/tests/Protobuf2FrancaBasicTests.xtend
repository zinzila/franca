/*******************************************************************************
 * Copyright (c) 2016 itemis AG (http://www.itemis.de).
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *******************************************************************************/
package org.franca.connectors.protobuf.tests

import org.eclipse.xtext.junit4.InjectWith
import org.eclipselabs.xtext.utils.unittesting.XtextRunner2
import org.franca.core.dsl.FrancaIDLTestsInjectorProvider
import org.junit.Ignore
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(typeof(XtextRunner2))
@InjectWith(typeof(FrancaIDLTestsInjectorProvider))
class Protobuf2FrancaBasicTests extends TestBase {

	val MODEL_DIR = "model/testcases/"
	val REF_DIR = "model/reference/"
	val GEN_DIR = "src-gen/testcases/"

	@Test
	def empty() {
		test("EmptyService")
		test("EmptyMessage")
	}
	
	@Test 
	def messageWithScalarValueTypeFields(){
		test("MessageWithScalarValueTypeFields")
	}

	@Test
	def serviceWithOneRPC(){
		test("ServiceWithOneRPC")
	}
	
	@Test
	def messageWithComplexTypeFields(){
		test("MessageWithComplexTypeFields")
	}
	
	@Test
	def messageWithComplexType(){
		test("MessageWithComplexType")
	}
	
	@Test
	def messageWithMessageField() {
		test("MessageWithMessageField")
	}

	@Test
	def oneOf() {
		test("MessageWithOneof")
	}
	
	@Test
	def extend() {
		test("MessageWithExtend")
	}
	
	@Test
	def extend_nested() {
		test("NestedExtensions")
	}
	
	@Test 
	def nameNotUnique(){
		test ("NameNotUnique")
	}
	
	@Test 
	def nestedTypes(){
		test ("NestedTypes")
	}
	
	@Test
	def test_Import() {
		test("MultiFiles")
	}

	@Test
	def option() {
		test("Option")
		//test("EnumWithOption")
	}
	
	@Test
	//FIXME implicit import
	@Ignore
	def customOptions() {
		test("CustomOptions")
	}
	
	@Test
	def descriptor(){
		test("descriptor")
	}
	
	@Test
	def enum_enumeratorValue(){
		test("Enum_enumeratorValue")
	}
	
	@Test
	def enum_emptyEnum(){
		test("Enum_emptyEnum")
	}

	/**
	 * Utility method for executing one transformation and comparing the result with a reference model.
	 */
	def private test(String inputfile) {
		testTransformation(inputfile, MODEL_DIR, GEN_DIR, REF_DIR)
	}

}