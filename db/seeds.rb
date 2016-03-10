Codeschool.create!([
  {name: "Codeschool 1", description: "the fist codeschool for testing", url: "http://google.com", logo: "somepic.jpg"}
])
Review.create!([
  {name: "john doe", description: "very nice", rating: 3, codeschool_id: 1}
])
