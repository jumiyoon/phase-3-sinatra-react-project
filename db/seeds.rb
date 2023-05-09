puts "🌱 Seeding spices..."

Parent.create([
    {
        family_name: "Yoons",
        phone: 1234567890,
        service_time: "1st Service"
    },
    {
        family_name: "Leighs",
        phone: 2345678901,
        service_time: "1st Service"
    },
    {
        family_name: "Garcias",
        phone: 3456789012,
        service_time: "2nd Service"
    }
])

Kid.create([
    {
        name: "Jumi",
        parent_id: 1,
        dietary_restrictions: "None",
    },
    {
        name: "Christy",
        parent_id: 1,
        dietary_restrictions: "None",
    },
    {
        name: "James",
        parent_id: 2,
        dietary_restrictions: "Gluten-free",
    },
    {
        name: "Jose",
        parent_id: 3,
        dietary_restrictions: "Apples",
    },
    {
        name: "Mila",
        parent_id: 3,
        dietary_restrictions: "Nuts",
    }
])

puts "✅ Done seeding!"
