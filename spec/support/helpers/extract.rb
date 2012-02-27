def extract_tag(name, string)
  match = string.match(/(?<#{name}><#{name} [\s\S]+ \/>)/) || string.match(/(?<#{name}><#{name} [\s\S]+><\/#{name}>)/)
  match[name]
end

def extract_attr(name, string)
  string.match(/#{name}=\"(?<#{name}>[a-z0-9 _-]+)\"/)[name]
end