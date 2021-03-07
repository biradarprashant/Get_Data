context("If JSON convert it in to list")

with_mock_api({
  test_that("are we getting JSOn response", {
    response <- getData("x")
    expect_is(response, "application/json")
  })
})

test_that("If JSON convert it in to list", {
  response <- getData("x")
  expect_is(response, "application/list")
  expect_output(print(response), "x")
})
