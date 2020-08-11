def all_words_capitalized?(arr)
    arr.all? { |word| word.capitalize == word }
end

def no_valid_url?(arr)
    ext = [".com", ".net", ".io", ".org"]
    arr.none? do |url|
        ext.any? {|e| url.end_with?(e)}
    end
end

def any_passing_students?(arr)
    arr.any? { |sash| sash[:grades].inject{|acc,el| acc+el}/(sash[:grades].length*1.0) >=75 }
end