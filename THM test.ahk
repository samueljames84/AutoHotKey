foo := b("a", , "foo")

Class a {
    __New(a, b?){
        ; ...
    }
}

Class b extends a {
    __New(a, b?, extraParam?){
        this.extraParam := extraParam
        super.__New(a, b?)
    }
}