Codeschool.create!([
  {name: "Codecademy", description: "Codecademy is an education company. But not one in the way you might think.", url: "https://www.codecademy.com", logo: "data:image/png;base64,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"},
  {name: "Codecademy2", description: "Codecademy is an education company. But not one in the way you might think.", url: "https://www.codecademy.com", logo: "data:image/png;base64,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"}
])
Review.create!([
  {name: "john doe", description: "very nice", rating: 3, codeschool_id: 1},
  {name: "jade doe", description: "very nice!!😁", rating: 3, codeschool_id: 1}
])
