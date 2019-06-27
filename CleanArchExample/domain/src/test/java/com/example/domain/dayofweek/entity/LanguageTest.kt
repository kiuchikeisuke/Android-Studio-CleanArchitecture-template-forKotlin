package com.example.domain.dayofweek.entity

import org.spekframework.spek2.Spek
import org.spekframework.spek2.style.specification.describe
import kotlin.test.assertEquals
import kotlin.test.assertTrue

internal object LanguageTest : Spek({
    describe("Language enum test") {
        context("support size") {
            // DEMO fix 2 -> 3
            it("2") {
                assertEquals(2, Language.values().size)
            }
        }

        context("has enum type") {
            it("English") {
                assertTrue { Language.values().contains(Language.English) }
            }
            it("Japanese") {
                assertTrue { Language.values().contains(Language.Japanese) }
            }
            // DEMO
//            it("Germany") {
//                assertTrue { Language.values().contains(Language.Germany) }
//            }
        }
    }


})