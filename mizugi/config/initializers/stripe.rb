Rails.configuration.stripe = {
  publishable_key: 'pk_test_hMEGPBhcsIwAMQu9FVsd84bI00llPf9YqW',
  secret_key: 'sk_test_bz1MmQRkw5IrAzq9RvspAyBJ00o1HfK03R'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]