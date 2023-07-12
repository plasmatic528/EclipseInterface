local Library = {}
-- Library:Create(name <string>, description <string>)
function Library:Create(name, description)
    name = name or "Hub"
    description = description or "Description"

    local Main = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local Topbar = Instance.new("Frame")
    local HubName = Instance.new("TextLabel")
    local close = Instance.new("ImageButton")
    local Tabholder = Instance.new("Frame")
    local UIListLayout_2 = Instance.new("UIListLayout")
    local TabFolder = Instance.new("Folder")

    Main.Name = "Main"
    Main.Parent = game.CoreGui
    Main.ResetOnSpawn = false

    MainFrame.Name = "MainFrame"
    MainFrame.Parent = Main
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.Size = UDim2.new(0, 425, 0, 252)
    MainFrame.Active = true
    MainFrame.Draggable = true

    TabFolder.Name = "TabFolder"
    TabFolder.Parent = MainFrame

    Topbar.Name = "Topbar"
    Topbar.Parent = MainFrame
    Topbar.AnchorPoint = Vector2.new(0.5, 0)
    Topbar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Topbar.BorderSizePixel = 0
    Topbar.Position = UDim2.new(0.500294089, 0, 0, 0)
    Topbar.Size = UDim2.new(0, 425, 0, 22)

    HubName.Name = "HubName"
    HubName.Parent = Topbar
    HubName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    HubName.BackgroundTransparency = 1.000
    HubName.Position = UDim2.new(0.0188679248, 0, 0, 0)
    HubName.Size = UDim2.new(0, 381, 0, 22)
    HubName.Font = Enum.Font.TitilliumWeb
    HubName.Text = name .. " - " .. description or "Hub - Description"
    HubName.TextColor3 = Color3.fromRGB(212, 212, 212)
    HubName.TextSize = 22.000
    HubName.TextXAlignment = Enum.TextXAlignment.Left

    close.Name = "close"
    close.Parent = Topbar
    close.BackgroundTransparency = 1.000
    close.Position = UDim2.new(0.946673512, 0, 0, 0)
    close.Size = UDim2.new(0, 22, 0, 22)
    close.ZIndex = 2
    close.Rotation = 0
    close.Image = "rbxassetid://3926305904"
    close.ImageColor3 = Color3.fromRGB(138, 138, 138)
    close.ImageRectOffset = Vector2.new(284, 4)
    close.ImageRectSize = Vector2.new(24, 24)

    close.MouseEnter:Connect(function()
        game:GetService("TweenService"):Create(close, TweenInfo.new(1, Enum.EasingStyle.Bounce), {Rotation = 180}):Play()
        game:GetService("TweenService"):Create(close, TweenInfo.new(0.25), {ImageColor3 = Color3.fromRGB(255,255,255)}):Play()
    end)
    
    
    close.MouseLeave:Connect(function()
        game:GetService("TweenService"):Create(close, TweenInfo.new(1, Enum.EasingStyle.Bounce), {Rotation = 0}):Play()
        game:GetService("TweenService"):Create(close, TweenInfo.new(0.25), {ImageColor3 = Color3.fromRGB(138, 138, 138)}):Play()
    end)

    close.MouseButton1Click:Connect(function()
        Main:Destroy()
    end)


    Tabholder.Name = "Tabholder"
    Tabholder.Parent = MainFrame
    Tabholder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Tabholder.BackgroundTransparency = 1.000
    Tabholder.Position = UDim2.new(0.0188235343, 0, 0.111111119, 0)
    Tabholder.Size = UDim2.new(0, 408, 0, 19)

    UIListLayout_2.Parent = Tabholder
    UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout_2.Padding = UDim.new(0, 5)

    local TabTable = {}
    function  TabTable:Tab(name)
        local Page = Instance.new("Frame")
        local TabButton = Instance.new("TextButton")
        local UIListLayout = Instance.new("UIListLayout")
        name = name or "Page"
        Page.Name = name or "Page"
        Page.Parent = TabFolder
        Page.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Page.BackgroundTransparency = 1.000
        Page.Position = UDim2.new(0.0188235287, 0, 0.210317463, 0)
        Page.Size = UDim2.new(0, 408, 0, 192)
        Page.Visible = false

        UIListLayout.Parent = Page
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.FillDirection = Enum.FillDirection.Vertical
        UIListLayout.Padding = UDim.new(0, 5)

        TabButton.Name = "TabButton"
        TabButton.Parent = Tabholder
        TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.BackgroundTransparency = 0.980
        TabButton.Size = UDim2.new(0, 79, 0, 20)
        TabButton.AutoButtonColor = false
        TabButton.Font = Enum.Font.Nunito
        TabButton.Text = name or "Page"
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.TextSize = 19.000
        TabButton.TextWrapped = true


        for i,v in pairs(TabFolder:GetChildren()) do
            if v:IsA("Frame") then
                v.Visible = false
            end
        end
        Page.Visible = true

        TabButton.MouseButton1Click:Connect(function()
            for i,v in pairs(TabFolder:GetChildren()) do
                if v:IsA("Frame") then
                    v.Visible = false
                end
            end
            TabFolder[name].Visible = true
        end)

        TabButton.MouseEnter:Connect(function()
            game:GetService("TweenService"):Create(TabButton, TweenInfo.new(0.25), {Size = UDim2.new(0, 120,0, 20)}):Play()
        end)
        
        TabButton.MouseLeave:Connect(function()
            game:GetService("TweenService"):Create(TabButton, TweenInfo.new(0.25), {Size = UDim2.new(0, 79,0, 20)}):Play()
        end)

        local Elements = {}

        function  Elements:Button(name, callback)
            name = name or "Button"
            callback = callback or function () end

            local Button = Instance.new("TextButton")
            Button.Name = name
            Button.Parent = Page
            Button.Text = name
            Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Button.BackgroundTransparency = 0.980
            Button.Size = UDim2.new(0, 409, 0, 22)
            Button.AutoButtonColor = false
            Button.Font = Enum.Font.Gotham
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.TextSize = 19.000
            Button.TextWrapped = true
            Button.MouseButton1Click:Connect(function()
                callback()
            end)

            Button.MouseEnter:Connect(function()
                game:GetService("TweenService"):Create(Button, TweenInfo.new(0.15), {Size = UDim2.new(0, 409,0, 32)}):Play()
                game:GetService("TweenService"):Create(Button, TweenInfo.new(0.15), {BackgroundTransparency = 0.93}):Play()
                game:GetService("TweenService"):Create(Button, TweenInfo.new(0.15), {TextSize = 23}):Play()
            end)
            
            Button.MouseLeave:Connect(function()
                game:GetService("TweenService"):Create(Button, TweenInfo.new(0.15), {Size = UDim2.new(0, 409,0, 22)}):Play()
                game:GetService("TweenService"):Create(Button, TweenInfo.new(0.15), {BackgroundTransparency = 0.98}):Play()
                game:GetService("TweenService"):Create(Button, TweenInfo.new(0.15), {TextSize = 19}):Play()
            end)
        end

        function Elements:Box(name, callback)
            name = name or "Box"
            callback = callback or function () end
            local TextBox = Instance.new("TextBox")

            TextBox.Name = name
            TextBox.Parent = Page
            TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextBox.BackgroundTransparency = 0.980
            TextBox.Size = UDim2.new(0, 409, 0, 22)
            TextBox.Font = Enum.Font.Gotham
            TextBox.Text = ""
            TextBox.PlaceholderText = name
            TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextBox.TextSize = 19.000
            TextBox.TextTransparency = 0.200
            TextBox.TextWrapped = true

            TextBox.MouseEnter:Connect(function()
                game:GetService("TweenService"):Create(TextBox, TweenInfo.new(0.15), {Size = UDim2.new(0, 409,0, 32)}):Play()
                game:GetService("TweenService"):Create(TextBox, TweenInfo.new(0.15), {BackgroundTransparency = 0.93}):Play()
                game:GetService("TweenService"):Create(ButTextBoxton, TweenInfo.new(0.15), {TextSize = 23}):Play()
            end)
            
            TextBox.MouseLeave:Connect(function()
                game:GetService("TweenService"):Create(TextBox, TweenInfo.new(0.15), {Size = UDim2.new(0, 409,0, 22)}):Play()
                game:GetService("TweenService"):Create(TextBox, TweenInfo.new(0.15), {BackgroundTransparency = 0.98}):Play()
                game:GetService("TweenService"):Create(TextBox, TweenInfo.new(0.15), {TextSize = 19}):Play()
            end)

            TextBox.FocusLost:Connect(function()
                callback(TextBox.Text)
            end)
        end

        function Elements:Toggle(name, callback)
            name = name or "Toggle"
            callback = callback or function() end
            local bool = false

            local Toggle = Instance.new("Frame")
            local ToggleButton = Instance.new("TextButton")
            local ToggleLabel = Instance.new("TextLabel")

            Toggle.Name = "Toggle"
            Toggle.Parent = Page
            Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Toggle.BackgroundTransparency = 0.980
            Toggle.BorderSizePixel = 0
            Toggle.Position = UDim2.new(0, 0, 0.28125, 0)
            Toggle.Size = UDim2.new(0, 381,0, 22)

            ToggleButton.Name = "ToggleButton"
            ToggleButton.Parent = Toggle
            ToggleButton.BackgroundColor3 = Color3.fromRGB(25,25,25)
            ToggleButton.BorderSizePixel = 0
            ToggleButton.Position = UDim2.new(1.019, 0,0, 0)
            ToggleButton.Size = UDim2.new(0, 24, 0, 22)
            ToggleButton.ZIndex = 4
            ToggleButton.AutoButtonColor = false
            ToggleButton.Font = Enum.Font.SourceSans
            ToggleButton.Text = ""
            ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleButton.TextSize = 14.000

            ToggleLabel.Name = "ToggleLabel"
            ToggleLabel.Parent = Toggle
            ToggleLabel.BackgroundColor3 = Color3.fromRGB(42,42,42)
            ToggleLabel.BackgroundTransparency = 1.000
            ToggleLabel.BorderSizePixel = 0
            ToggleLabel.Position = UDim2.new(-0.000553088263, 0, 0, 0)
            ToggleLabel.Selectable = true
            ToggleLabel.Size = UDim2.new(0, 409, 0, 22)
            ToggleLabel.Font = Enum.Font.Gotham
            ToggleLabel.Text = name
            ToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleLabel.TextSize = 19.000

            ToggleButton.MouseButton1Click:Connect(function()
                if bool == false then
                    bool = true
                    game:GetService("TweenService"):Create(ToggleButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 143, 212)}):Play()
                    callback(bool)
                elseif bool == true then
                    bool = false
                    game:GetService("TweenService"):Create(ToggleButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(25,25,25)}):Play()
                    callback(bool)
                end
            end)
        end

        function Elements:Paragraph(text)
            text = text or "Paragraph"
            local Paragraph = Instance.new("TextLabel")
            local UIPadding = Instance.new("UIPadding")

            Paragraph.Name = "Paragraph"
            Paragraph.Parent = Page
            Paragraph.Active = true
            Paragraph.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Paragraph.BackgroundTransparency = 0.980
            Paragraph.Position = UDim2.new(0, 0, 0.421875, 0)
            Paragraph.Selectable = true
            Paragraph.Size = UDim2.new(0, 409, 0, 76)
            Paragraph.Font = Enum.Font.Gotham
            Paragraph.Text = text
            Paragraph.TextColor3 = Color3.fromRGB(255, 255, 255)
            Paragraph.TextSize = 19.000
            Paragraph.TextWrapped = true
            Paragraph.TextXAlignment = Enum.TextXAlignment.Left
            Paragraph.TextYAlignment = Enum.TextYAlignment.Top

            UIPadding.Parent = Paragraph
            UIPadding.PaddingLeft = UDim.new(0, 5)
            UIPadding.PaddingTop = UDim.new(0, 2)
            UIPadding.PaddingRight = UDim.new(0,5)
       end

       function Elements:BoxToggle(name, callback)
            name = name or "BoxToggle"
            callback = callback or function() end
            local bool = false

            local BoxToggle = Instance.new("Frame")
            local Box = Instance.new("TextBox")
            local ToggleButton = Instance.new("TextButton")

            BoxToggle.Name = "BoxToggle"
            BoxToggle.Parent = Page
            BoxToggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            BoxToggle.BackgroundTransparency = 0.980
            BoxToggle.BorderSizePixel = 0
            BoxToggle.Position = UDim2.new(0, 0, 0.421875, 0)
            BoxToggle.Size = UDim2.new(0, 381, 0, 22)

            Box.Name = "Box"
            Box.Parent = BoxToggle
            Box.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            Box.BackgroundTransparency = 0.995
            Box.BorderSizePixel = 0
            Box.Size = UDim2.new(0, 381, 0, 22)
            Box.Font = Enum.Font.Gotham
            Box.Text = ""
            Box.PlaceholderText = name
            Box.TextColor3 = Color3.fromRGB(177, 177, 177)
            Box.TextSize = 19.000
            Box.TextTransparency = 0.200
            Box.TextWrapped = true

            ToggleButton.Name = "ToggleButton"
            ToggleButton.Parent = BoxToggle
            ToggleButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            ToggleButton.BorderSizePixel = 0
            ToggleButton.Position = UDim2.new(1.01910985, 0, 0, 0)
            ToggleButton.Size = UDim2.new(0, 24, 0, 22)
            ToggleButton.ZIndex = 4
            ToggleButton.AutoButtonColor = false
            ToggleButton.Font = Enum.Font.SourceSans
            ToggleButton.Text = ""
            ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleButton.TextSize = 14.000

            Box.FocusLost:Connect(function()
                callback(Box.ContentText, bool)
            end)

            ToggleButton.MouseButton1Click:Connect(function()
                if bool == false then
                    bool = true
                    game:GetService("TweenService"):Create(ToggleButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 143, 212)}):Play()
                    callback(Box.ContentText, bool)
                elseif bool == true then
                    bool = false
                    game:GetService("TweenService"):Create(ToggleButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(25,25,25)}):Play()
                    callback(Box.ContentText, bool)
                end
            end)
       end

        return Elements
    end

    return TabTable
end

return Library
