; ChangeCase >>Convert a sentence with the every 1st letter of the word with capital letter
ChangeCase(Text) {
    ; Split the text into words
    Words := StrSplit(Text, " ")
    NewText := ""
    
    ; Loop through each word
    for Index, Word in Words {
        ; Convert the first letter to uppercase and the rest to lowercase
        NewText .= (Index = 1 ? "" : " ") . StrUpper(SubStr(Word, 1, 1)) . StrLower(SubStr(Word, 2))
    }
    
    return NewText
}
