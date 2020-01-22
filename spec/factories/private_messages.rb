FactoryBot.define do 
  factory :private_message, class: 'Private::Message' do
    body {'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'} 
    association :conversation, factory: :private_conversation
    user
  end
end
