using Dates
using PenultimateDays
using Test

#=Test.eval(quote
	function record(ts::DefaultTestSet, t::Error)  # t::Union{Fail, Error}
        if t isa Error
            e = only(match(r"^(\w+)\(.*\)$", t.value).captures)
            if e == "ErrorException" # || e == "MethodError"
                push!(ts.results, t)
            end
        end
	end
end)
=#

@testset "PenultimateDays.jl" begin
    d1 = Date(2022, 6, 24)
    d2 = Date(2023, 1, 12)
    d3 = Date(2033, 2, 7)
    dt = DateTime("1996-01-05T12:30:00")
    
    @testset "Trivial Penultimate Functions" begin
        # Week
        @test penultimatedayofweek(d1) == Date(2022, 6, 25)
        @test penultimatedayofweek(d2) == Date(2023, 1, 14)
        @test penultimatedayofweek(d3) == Date(2033, 2, 12)
        
        # Month
        @test penultimatedayofmonth(d1) == Date(2022, 6, 29)
        @test penultimatedayofmonth(d2) == Date(2023, 1, 30)
        @test penultimatedayofmonth(d3) == Date(2033, 2, 27)
        
        # Quarter
        @test penultimatedayofquarter(d1) == Date(2022, 6, 29)
        @test penultimatedayofquarter(d2) == Date(2023, 3, 30)
        @test penultimatedayofquarter(d3) == Date(2033, 3, 30)
        
        # Year
        @test penultimatedayofyear(d1) == Date(2022, 12, 30)
        @test penultimatedayofyear(d2) == Date(2023, 12, 30)
        @test penultimatedayofyear(d3) == Date(2033, 12, 30)
        
        # Time type
        @test penultimatedayofweek(dt) isa typeof(dt)
        @test penultimatedayofmonth(dt) isa typeof(dt)
        @test penultimatedayofquarter(dt) isa typeof(dt)
        @test penultimatedayofyear(dt) isa typeof(dt)
    end
    
    @testset "Day-specific Penultimate Functions" begin
        # Week
        ## Cannot have a second to last specified day in a week, which
        ## only contains one of each day
        @test_throws ArgumentError penultimatedayofweek(d1, Tuesday)
        
        # Month
        @test penultimatedayofmonth(d1, Monday) == Date(2022, 6, 20)
        @test penultimatedayofmonth(d1, Wednesday) == Date(2022, 6, 22)
        @test penultimatedayofmonth(d1, Sunday) == Date(2022, 6, 19)
        @test penultimatedayofmonth(d2, Monday) == Date(2023, 1, 23)
        @test penultimatedayofmonth(d2, Wednesday) == Date(2023, 1, 18)
        @test penultimatedayofmonth(d2, Sunday) == Date(2023, 1, 22)
        @test penultimatedayofmonth(d3, Monday) == Date(2033, 2, 21)
        @test penultimatedayofmonth(d3, Wednesday) == Date(2033, 2, 16)
        @test penultimatedayofmonth(d3, Sunday) == Date(2033, 2, 20)
        
        # Quarter
        @test penultimatedayofquarter(d1, Monday) == Date(2022, 6, 20)
        @test penultimatedayofquarter(d1, Wednesday) == Date(2022, 6, 22)
        @test penultimatedayofquarter(d1, Sunday) == Date(2022, 19)
        @test penultimatedayofquarter(d2, Monday) == Date(2023, 3, 20)
        @test penultimatedayofquarter(d2, Wednesday) == Date(2023, 3, 22)
        @test penultimatedayofquarter(d2, Sunday) == Date(2023, 3, 19)
        @test penultimatedayofquarter(d3, Monday) == Date(2033, 3, 20)
        @test penultimatedayofquarter(d3, Wednesday) == Date(2033, 3, 23)
        @test penultimatedayofquarter(d3, Sunday) == Date(2033, 3, 20)
        
        # Year
        @test penultimatedayofyear(d1, Monday) == Date(2022, 12, 19)
        @test penultimatedayofyear(d1, Wednesday) == Date(2022, 12, 21)
        @test penultimatedayofyear(d1, Sunday) == Date(2022, 12, 18)
        @test penultimatedayofyear(d2, Monday) == Date(2023, 12, 18)
        @test penultimatedayofyear(d2, Wednesday) == Date(2023, 12, 20)
        @test penultimatedayofyear(d2, Sunday) == Date(2023, 12, 24)
        @test penultimatedayofyear(d3, Monday) == Date(2033, 12, 19)
        @test penultimatedayofyear(d3, Wednesday) == Date(2033, 12, 21)
        @test penultimatedayofyear(d3, Sunday) == Date(2033, 12, 18)
        
        # Time type
        @test penultimatedayofmonth(dt, Tuesday) isa typeof(dt)
        @test penultimatedayofquarter(dt, Tuesday) isa typeof(dt)
        @test penultimatedayofyear(dt, Tuesday) isa typeof(dt)
    end
    
    @testset "Dates (stdlib) Extended" begin
        # Week
        @test firstdayofweek(d1, Monday) == Date(2022, 6, 20)
        @test firstdayofweek(d1, Wednesday) == Date(2022, 6, 22)
        @test firstdayofweek(d1, Sunday) == Date(2022, 6, 26)
        @test firstdayofweek(d2, Monday) == Date(2023, 1, 9)
        @test firstdayofweek(d2, Wednesday) == Date(2023, 1, 11)
        @test firstdayofweek(d2, Sunday) == Date(2023, 1, 15)
        @test firstdayofweek(d3, Monday) == Date(2033, 2, 7)
        @test firstdayofweek(d3, Wednesday) == Date(2033, 2, 9)
        @test firstdayofweek(d3, Sunday) == Date(2033, 2, 13)
        @test lastdayofweek(d1, Monday) == Date(2022, 6, 20)
        @test lastdayofweek(d1, Wednesday) == Date(2022, 6, 22)
        @test lastdayofweek(d1, Sunday) == Date(2022, 6, 26)
        @test lastdayofweek(d2, Monday) == Date(2023, 1, 9)
        @test lastdayofweek(d2, Wednesday) == Date(2023, 1, 11)
        @test lastdayofweek(d2, Sunday) == Date(2023, 1, 15)
        @test lastdayofweek(d3, Monday) == Date(2033, 2, 7)
        @test lastdayofweek(d3, Wednesday) == Date(2033, 2, 9)
        @test lastdayofweek(d3, Sunday) == Date(2033, 2, 13)
        
        # Month
        @test firstdayofmonth(d1, Monday) == Date(2022, 6, 6)
        @test firstdayofmonth(d1, Wednesday) == Date(2022, 6, 1)
        @test firstdayofmonth(d1, Sunday) == Date(2022, 6, 5)
        @test firstdayofmonth(d2, Monday) == Date(2023, 1, 2)
        @test firstdayofmonth(d2, Wednesday) == Date(2023, 1, 4)
        @test firstdayofmonth(d2, Sunday) == Date(2023, 1, 1)
        @test firstdayofmonth(d3, Monday) == Date(2033, 2, 7)
        @test firstdayofmonth(d3, Wednesday) == Date(2033, 2, 2)
        @test firstdayofmonth(d3, Sunday) == Date(2033, 2, 6)
        @test lastdayofmonth(d1, Monday) == Date(2022, 6, 27)
        @test lastdayofmonth(d1, Wednesday) == Date(2022, 6, 29)
        @test lastdayofmonth(d1, Sunday) == Date(2022, 6, 26)
        @test lastdayofmonth(d2, Monday) == Date(2023, 1, 30)
        @test lastdayofmonth(d2, Wednesday) == Date(2023, 1, 25)
        @test lastdayofmonth(d2, Sunday) == Date(2023, 1, 29)
        @test lastdayofmonth(d3, Monday) == Date(2033, 2, 28)
        @test lastdayofmonth(d3, Wednesday) == Date(2033, 2, 23)
        @test lastdayofmonth(d3, Sunday) == Date(2033, 2, 27)
        
        # Quarter
        @test firstdayofquarter(d1, Monday) == Date(2022, 4, 4)
        @test firstdayofquarter(d1, Wednesday) == Date(2022, 4, 6)
        @test firstdayofquarter(d1, Sunday) == Date(2022, 4, 3)
        @test firstdayofquarter(d2, Monday) == Date(2023, 1, 2)
        @test firstdayofquarter(d2, Wednesday) == Date(2023, 1, 4)
        @test firstdayofquarter(d2, Sunday) == Date(2023, 1, 1)
        @test firstdayofquarter(d3, Monday) == Date(2033, 1, 3)
        @test firstdayofquarter(d3, Wednesday) == Date(2033, 1, 5)
        @test firstdayofquarter(d3, Sunday) == Date(2033, 1, 2)
        @test lastdayofquarter(d1, Monday) == Date(2022, 6, 27)
        @test lastdayofquarter(d1, Wednesday) == Date(2022, 6, 29)
        @test lastdayofquarter(d1, Sunday) == Date(2022, 6, 26)
        @test lastdayofquarter(d2, Monday) == Date(2023, 3, 27)
        @test lastdayofquarter(d2, Wednesday) == Date(2023, 3, 29)
        @test lastdayofquarter(d2, Sunday) == Date(2023, 3, 26)
        @test lastdayofquarter(d3, Monday) == Date(2033, 3, 28)
        @test lastdayofquarter(d3, Wednesday) == Date(2033, 3, 30)
        @test lastdayofquarter(d3, Sunday) == Date(2033, 3, 27)
        
        # Year
        @test firstdayofyear(d1, Monday) == Date(2022, 1, 3)
        @test firstdayofyear(d1, Wednesday) == Date(2022, 1, 5)
        @test firstdayofyear(d1, Sunday) == Date(2022, 1, 2)
        @test firstdayofyear(d2, Monday) == Date(2023, 1, 2)
        @test firstdayofyear(d2, Wednesday) == Date(2023, 1, 4)
        @test firstdayofyear(d2, Sunday) == Date(2023, 1, 1)
        @test firstdayofyear(d3, Monday) == Date(2033, 1, 3)
        @test firstdayofyear(d3, Wednesday) == Date(2033, 1, 5)
        @test firstdayofyear(d3, Sunday) == Date(2033, 1, 2)
        @test lastdayofyear(d1, Monday) == Date(2022, 12, 26)
        @test lastdayofyear(d1, Wednesday) == Date(2022, 12, 28)
        @test lastdayofyear(d1, Sunday) == Date(2022, 12, 25)
        @test lastdayofyear(d2, Monday) == Date(2023, 12, 25)
        @test lastdayofyear(d2, Wednesday) == Date(2023, 12, 27)
        @test lastdayofyear(d2, Sunday) == Date(2023, 12, 31)
        @test lastdayofyear(d3, Monday) == Date(2033, 12, 26)
        @test lastdayofyear(d3, Wednesday) == Date(2033, 12, 28)
        @test lastdayofyear(d3, Sunday) == Date(2033, 12, 25)
        
        # Time type
        @test firstdayofweek(dt, Tuesday) isa typeof(dt)
        @test lastdayofweek(dt, Tuesday) isa typeof(dt)
        @test firstdayofmonth(dt, Tuesday) isa typeof(dt)
        @test lastdayofmonth(dt, Tuesday) isa typeof(dt)
        @test firstdayofquarter(dt, Tuesday) isa typeof(dt)
        @test lastdayofquarter(dt, Tuesday) isa typeof(dt)
        @test firstdayofyear(dt, Tuesday) isa typeof(dt)
        @test lastdayofyear(dt, Tuesday) isa typeof(dt)
    end
end
