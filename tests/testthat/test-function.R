context("If JSON convert it in to list")

with_mock_api({
  test_that("are we getting JSOn response", {
    response <- getData("x")
  })
})

test_that("If JSON convert it in to list", {
  user <- getData("x")
  expect_is(response, "application/json")
  expect_output(print(response), "x")
})
