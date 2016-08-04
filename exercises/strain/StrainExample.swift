extension Array {

    func keep(_ compare: Bool = true, inputFunc: (Element) -> Bool ) -> Array {
        var array2Return: Array = []
        for each in self {
            if inputFunc(each) == compare {
                array2Return.append(each)}
        }
        return array2Return
    }

    func discard(_ inputFunc: (Element) -> Bool) -> Array {
        return keep(false, inputFunc: inputFunc)
    }
}
