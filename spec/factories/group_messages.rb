FactoryBot.define do 
  factory :group_message, class: 'Group::Message' do
    content 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
    association :conversation, factory: :group_conversation
    user
  end
end
