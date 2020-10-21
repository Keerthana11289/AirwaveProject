***Settings***
Library		ExcelLibrary
Library		Collections
Library		String

*** Variables ***
${ExcelLocation}
${This_DataProvider}
${Get_MatchingColumn_Index}
${SheetName}

***Keywords***
#Reads all the row-values for the given test case from the Excel. 
DataProvider
    [Arguments]    ${GivenTestCase_Name}
    Open Excel    ${ExcelLocation}
    Log  ${GivenTestCase_Name}
    ${TestCases_Count} =  Get Column Count  ${SheetName}    
    ${TestCaseNamesList} =  Create List
    Log  ${TestCaseNamesList}
    
    :FOR  ${i}  IN RANGE  0  ${TestCases_Count}
    \  ${TestCaseName} =  Read Cell Data By Coordinates  ${SheetName}  ${i}  0
    \  Append To List  ${TestCaseNamesList}  ${TestCaseName}
    \  Log  ${TestCaseNamesList}
        
    ${Get_MatchingColumn_Index} =  Get Index From List  ${TestCaseNamesList}  ${GivenTestCase_Name}
    Set Suite Variable  ${Get_MatchingColumn_Index}
    Log  ${Get_MatchingColumn_Index}
    ${DataProvider} =    Get Column Values    ${SheetName}  ${Get_MatchingColumn_Index}
    [return]  ${DataProvider}

#Provides the matching row-value for the given row-key.    
GetDataProviderColumnValue
	[Arguments]    ${RowAttribut_Name}
	Log  ${This_DataProvider}
	${RowAttribut_Name_Split} =  Split String  ${RowAttribut_Name}  _
	${RowAttribut_Name} =  Get From List  ${RowAttribut_Name_Split}  1
	Log  ${RowAttribut_Name}
	${TestData_Rows_Count} =  Get Row Count  ${SheetName}
	${TestData_RowNames_List} =  Create List
    Log  ${TestData_RowNames_List}
    
    :FOR  ${i}  IN RANGE  0  ${TestData_Rows_Count}
    \  ${RowName} =  Read Cell Data By Coordinates  ${SheetName}  0  ${i}
    \  Append To List  ${TestData_RowNames_List}  ${RowName}
    \  Log  ${TestData_RowNames_List}
    
    ${Get_MatchingRow_Index} =  Get Index From List  ${TestData_RowNames_List}  ${RowAttribut_Name}	
    ${DataString} =  Read Cell Data By Coordinates  ${SheetName}  ${Get_MatchingColumn_Index}   ${Get_MatchingRow_Index}
	Log  ${DataString}
    [return]  ${DataString}  
    
DataProviderSplitterForMultipleValues    
    [Arguments]    ${ColumnValueString}  ${Value_Index}
    ${StringAfterSplit} =  Split String  ${ColumnValueString}  ,	
    ${Index} =  Evaluate  ${Value_Index} - 1
    ${RequiredString} =  Get From List  ${StringAfterSplit}  ${Index}
    [return]  ${RequiredString}
    
DataProviderSplitterValues-Total    
    [Arguments]    ${ColumnValueString}
    ${StringAfterSplit} =  Split String  ${ColumnValueString}  ,     
    ${TotalValuesInRow} =  Get Length  ${StringAfterSplit}    
    [return]  ${TotalValuesInRow}
    
DataProviderSplitterValuesInDataList    
    [Arguments]    ${ColumnValueString}
    ${StringAfterSplit} =  Split String  ${ColumnValueString}  , 
    [return]  ${StringAfterSplit}
    
