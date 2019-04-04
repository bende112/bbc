require 'json'

def baseUrl()
  return ENV['base_Url']
end

def actionDropdownSelector(column, value)
  columnIndex = all('.content table thead tr th')
                    .map {|x| x.text.downcase}
                    .find_index(column.downcase)

  rowIndex = all(".content table tbody tr")
                 .map {|x| x.all('td')}
                 .map {|x| x[columnIndex]}
                 .map {|x| x.text}
                 .find_index(value)

  return '.content table tbody tr:nth-of-type(' + (rowIndex + 1).to_s + ') '
end
